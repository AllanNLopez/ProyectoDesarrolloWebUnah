
$(document).ready(function() {
	//####agregar funcionalidad de editar#######
	$("#btnEditar").click(function(){
		$('.campoUsuario').removeAttr("readonly");
		habilitarbotones();
		
	});

	$("#btnAceptar").click(function(){
		
		validaCampos();
		

		
		
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


	function validaCampos(){

		// removi el atributo "hiden" en la archivo user/index.html 
		var camposValidos =	validarCampo($("#txtNames").val(), "nombre", "txtNames")&&
							validarCampo($("#txtLastname").val(), "apellido", "txtLastname")&&
							validarCampo($("#txtEmail").val(), "email", "txtEmail")&&
							validarCampo($("#txtPhone").val(), "phone", "txtPhone")&&
							validarCampo($("#txtPassword").val(), "password", "txtPassword")&&
							validarCampo($("#txtPassword").val(), "password", "txtPassword");

		
		if( camposValidos){


			console.log("campos validos");
			$('.campoUsuario').attr("readonly",true);
			dehabilitarbotones();
			

		}else{
			console.log("campos invalidos");
			habilitarbotones();
			$('.campoUsuario').removeAttr("readonly");
		}

	}




    $('table.display').DataTable(  ); 
} );


