<script>
    
	var listener = new window.keypress.Listener();  //https://github.com/dmauro/Keypress

    listener.simple_combo("f9", function() {		
		livewire.emit('saveSale')
	})

    listener.simple_combo("f8", function() {
		document.getElementById('cash').value =''
		document.getElementById('cash').focus()		
	})

    listener.simple_combo("f4", function() {
		var total = parseFloat(document.getElementById('hiddenTotal').value="")		
		
        if(total > 0) {
			Confirm(0, 'clearCart', '¿SEGUR@ DE ELIMINAR EL CARRITO?')
		} else {
			noty('AGREGA PRODUCTOS A LA VENTA')
		}
        
	})

</script>