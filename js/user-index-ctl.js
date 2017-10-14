
$(document).ready(function() {
	//####agregar funcionalidad de editar#######
	$("#btnEditar").click(function(){
		$('.campoUsuario').removeAttr("readonly");
		habilitarbotones();
		
	});

	$("#btnAceptar").click(function(){
		$('.campoUsuario').attr("readonly",true);
		dehabilitarbotones();
		

	});

	$("#btnCancelar").click(function(){
		$('.campoUsuario').attr("readonly",true);
		dehabilitarbotones();
		

	});

	function habilitarbotones(){
		$("#btnAceptar").prop("disabled",false);
		$("#btnCancelar").prop("disabled",false);

	}

	function dehabilitarbotones(){
		$("#btnAceptar").prop("disabled",true);
		$("#btnCancelar").prop("disabled",true);
		
	}



    $('table.display').DataTable(  ); 
} );


