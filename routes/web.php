<?php

use Illuminate\Support\Facades\Route;
use App\Http\Livewire\CategoriesController;
use App\Http\Livewire\ProductsController;
use App\Http\Livewire\CoinsController;
use App\Http\Livewire\PosController;
use App\Http\Livewire\RolesController;
use App\Http\Livewire\PermisosController;
use App\Http\Livewire\AsignarController;
use App\Http\Livewire\UsersController;
use App\Http\Livewire\CashoutController;
use App\Http\Livewire\ReportsController;
use App\Http\Controllers\ExportController;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

//middleware me permite proteger la ruta en caso de que el usuario no este logeado
Route::middleware(['auth'])->group(function () {
    //Rutas protegidas 
    Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
    Route::get('categories', CategoriesController::class)->middleware('role:Admin'); //solo los administradores tendran accesos a categorias.
    Route::get('products', ProductsController::class);

    Route::group(['middleware' => ['role:Admin']], function () {
        Route::get('coins', CoinsController::class);
        Route::get('pos', PosController::class);
        Route::get('roles', RolesController::class);
        Route::get('permisos', PermisosController::class);
        Route::get('asignar', AsignarController::class);
    });
    
    Route::get('users', UsersController::class);
    Route::get('cashout', CashoutController::class);
    Route::get('reports', ReportsController::class);

    //reportes PDF
    Route::get('report/pdf/{user}/{type}/{f1}/{f2}', [ExportController::class, 'reportPDF']);
    Route::get('report/pdf/{user}/{type}', [ExportController::class, 'reportPDF']);
    Route::get('report/pdf', [ExportController::class, 'pdfeee']);


    //reportes EXCEL
    Route::get('report/excel/{user}/{type}/{f1}/{f2}', [ExportController::class, 'reporteExcel']);
    Route::get('report/excel/{user}/{type}', [ExportController::class, 'reporteExcel']);

});


