

$(document).ready(function(){
	$('#carrito').DataTable({
		"dom": '<"toolbar">frtip'
	}); 
	
	
});


/*   funciones para ocultar y aparecer el sidebar  */
if (screen.width <480) {
    	document.getElementById("mySidenav").style.width = "0";
    	document.getElementById("main").style.marginLeft= "0";
}else
{
	$('#close-link').addClass('hidden');
	$('#btnOpciones').addClass('hidden');
}

function openNav() {
	if (screen.width <480) {
		document.getElementById("mySidenav").style.width = "100%"; 
		document.getElementById("mySidenav").style.height = "100%";
		document.getElementById("mySidenav").style.position = "fixed";
		//document.getElementById("main").style.marginLeft = "250px";
		//document.getElementById("main").style.display = "none";  
	}else
	{
		document.getElementById("mySidenav").style.width = "250px";
		document.getElementById("main").style.marginLeft = "250px";
		document.getElementById("mySidenav").style.height = "auto";
	}
}

function closeNav() {
	document.getElementById("mySidenav").style.width = "0";
	document.getElementById("main").style.marginLeft= "0";
	//document.getElementById("main").style.display = "block";
	$("#mySidenav").removeClass("sidenav-small");
}


/* Funciones de validacion */

function validarTelefono(telefono){

}

function validarIdentidad(id){
	var re = /\d{4}-\d{4}-\d{5}/;
	if(re.test(id)){
		return 1;
	}else
		return 0;
}

