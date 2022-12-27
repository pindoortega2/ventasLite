<?php

namespace App\Http\Livewire;

use Darryldecode\Cart\Facades\CartFacade as Cart;   //https://github.com/darryldecode/laravelshoppingcart
use App\Models\Denomination;
use App\Models\Product;
use App\Models\Sale;
use App\Models\SaleDetail;
use Livewire\Component;

use DB;

class PosController extends Component {

    public $total, $itemsQuantity, $efectivo, $change;

    // Es lo primero que se ejecuta en el componente de livewire
    public function mount() {
		$this->efectivo = 0;		
		$this->change = 0;			
		$this->total = Cart::getTotal(); //Trae el total del carrito dinero		
		$this->itemsQuantity = Cart::getTotalQuantity(); //Trae el total del carrito en unidades		
	}

    public function render() {

        return view('livewire.pos.component', [
			'denominations' => Denomination::orderBy('value', 'desc')->get(),
			'cart' => Cart::getContent()->sortBy('name'),			
		])
        ->extends('layouts.theme.app')
        ->section('content');
    }

    // agregar efectivo / denominations
	public function ACash($value) {
		$this->efectivo = 0;
		$this->efectivo += ($value == 0 ? $this->total : $value);
		$this->change = ($this->efectivo - $this->total);
	}

    // escuchar eventos
	protected $listeners = [
		'scan-code'  =>  'ScanCode',
		'removeItem' => 'removeItem',
		'clearCart'  => 'clearCart',
		'saveSale'   => 'saveSale',
		'refresh' => '$refresh',
		'print-last' => 'printLast'
	];

	public function ScanCode($barcode, $cant = 1) {

		$product = Product::where('barcode', $barcode)->first();

		if ($product == null || empty($product)) {
			$this->emit('scan-notfound', 'El producto no esta registrado');
		}else {

			if($this->InCart($product->id)) {
				$this->increaseQty($product->id);
				return;
			}

			if ($product->stock < 1 ) {
				$this->emit('no-stock', 'Stock insuficiente');
				return;
			}

			Cart::add($product->id, $product->name, $product->price, $cant, $product->image); //Agrega el producto al carrito de compras
			$this->total = Cart::getTotal(); //Actualiza mi carrito 

			$this->emit('scan-ok', 'Producto Agregado');

		}
	}


	public function InCart($productId) {
		$exist = Cart::get($productId); //si existe el id de un producto
		if($exist)
			return true;
		else 
			return false;
	}

	public function increaseQty($productId, $cant = 1) { //Incrementar la cantidad de productos en el carrito

		$title = '';
		$product = Product::find($productId);		
		$exist = Cart::get($productId);
		if($exist)
			$title = 'Cantidad actualizada';
		else 
			$title = 'Producto Agregado';
			
		if ($exist) {
			if($product->stock < ($cant + $exist->quantity)){
				$this->emit('no-stock', 'Stock Insuficiente');
				return;
			}
		}

		Cart::add($product->id, $product->name, $product->price, $cant, $product->image); //Agrega el producto al carrito de compras
		$this->total = Cart::getTotal(); //Actualiza mi carrito 
		$this->itemsQuantity = Cart::getTotalQuantity();

		$this->emit('scan-ok', $title);

	}

	public function updateQty ($productId, $cant = 1) {

		$title = '';
		$product = Product::find($productId);
		$exist = Cart::get($productId);
		if($exist)
			$title = 'Cantidad actualizada';
		else 
			$title = 'Producto Agregado';
			
		if ($exist) {
			if($product->stock < $cant){
				$this->emit('no-stock', 'Stock Insuficiente');
				return;
			}
		}

		$this->removeItem($productId);

		if ($cant > 0) {
			Cart::add($product->id, $product->name, $product->price, $cant, $product->image); //Agrega el producto al carrito de compras
			$this->total = Cart::getTotal(); //Actualiza mi carrito 
			$this->itemsQuantity = Cart::getTotalQuantity();

			$this->emit('scan-ok', $title);
		}
	}


	public function removeItem($productId) {  //Elimina el producto del carrito

		Cart::remove($productId);

		$this->total = Cart::getTotal(); //Actualiza mi carrito 
		$this->itemsQuantity = Cart::getTotalQuantity();

		$this->emit('scan-ok', 'Producto Eliminado');

	}

	public function decreaseQty($productId) {

		$item = Cart::get($productId);
		Cart::remove($productId);

		//si el producto no tiene imagen, mostramos un por default
		//$img = (count($item->attributes) > 0 ? $item->attributes[0] : Product::find($productId)->imagen);

		$product = Product::find($productId);
		$newQty = ($item->quantity) - 1;

		if($newQty > 0) 

			Cart::add($item->id, $item->name, $item->price, $newQty, $item->image); //Agrega el producto al carrito de compras
			
			$this->total = Cart::getTotal(); //Actualiza mi carrito 
			$this->itemsQuantity = Cart::getTotalQuantity();

			$this->emit('scan-ok', 'Cantidad Actualizada');

	}

	public function clearCart() {
		Cart::clear();
		$this->efectivo = 0;
		$this->change = 0;

		$this->total = Cart::getTotal();
		$this->itemsQuantity = Cart::getTotalQuantity();

		$this->emit('scan-ok', 'Carrito Vacio');

	}

	public function saveSale() {

		if ($this->total <= 0) {
			$this->emit('sale-error', 'AGEGA PRODUCTOS A LA VENTA');
			return;
		}

		if ($this->efectivo <= 0) {
			$this->emit('sale-error', 'INGRESA EL EFECTIVO');
			return;
		}

		if ($this->total > $this->efectivo) {
			$this->emit('sale-error', 'EL EFECTIVO DEBE SER MAYOR O IGUAL AL TOTAL');
			return;
		}

		DB::beginTransaction(); //https://blog.codmind.com/transacciones-en-laravel/

		try {

			$sale = Sale::create([
				'total' => $this->total,
				'items' => $this->itemsQuantity,
				'cash' => $this->efectivo,
				'change' => $this->change,
				'user_id' => Auth()->user()->id
			]);

			if ($sale) {
				$items = Cart::getContent();
				foreach ($items as  $item) {
					SaleDetail::create([
						'price' => $item->price,
						'quantity' => $item->quantity,
						'product_id' => $item->id,
						'sale_id' => $sale->id,
					]);

					//update stock
					$product = Product::find($item->id);
					$product->stock = $product->stock - $item->quantity;
					$product->save();
				}
			}


			DB::commit();

			Cart::clear();
			$this->efectivo = 0;
			$this->change = 0;
			$this->total = Cart::getTotal();
			$this->itemsQuantity = Cart::getTotalQuantity();
			$this->emit('sale-ok', 'Venta registrada con éxito');
			$this->emit('print-ticket', $sale->id);

		} catch (Exception $e) {
			DB::rollback();
			$this->emit('sale-error', $e->getMessage());
		}

	}	

	public function printTicket($ventaId){

		return \Redirect::to("print://$ventaId");

	}

}
