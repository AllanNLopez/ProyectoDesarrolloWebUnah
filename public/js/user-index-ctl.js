
$(document).ready(function() {
	//####agregar funcionalidad de editar#######

	extraersDatosdeBD();

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
		validarCampo($("#txtNames").val(), "nombre", "txtNames");
		validarCampo($("#txtLastname").val(), "apellido", "txtLastname");
		validarCampo($("#txtEmail").val(), "email", "txtEmail");
		validarCampo($("#txtPhone").val(), "phone", "txtPhone");
		validarCampo($("#txtPassword").val(), "password", "txtPassword");
		validarCampo($("#txtPassword").val(), "password", "txtPassword");


		// removi el atributo "hiden" en la archivo user/index.html 
		var camposValidos =	validarCampo($("#txtNames").val(), "nombre", "txtNames")&&
							validarCampo($("#txtLastname").val(), "apellido", "txtLastname")&&
							validarCampo($("#txtEmail").val(), "email", "txtEmail")&&
							validarCampo($("#txtPhone").val(), "phone", "txtPhone")&&
							validarCampo($("#txtPassword").val(), "password", "txtPassword")&&
							validarCampo($("#txtPassword").val(), "password", "txtPassword");
		
		if( camposValidos){
			console.log("campos validos");
			
			enviarInfo();
			$('.campoUsuario').attr("readonly",true);
			dehabilitarbotones();
		}else{
			console.log("campos invalidos");
			habilitarbotones();
			$('.campoUsuario').removeAttr("readonly");
		}

	}

	function enviarInfo(){
		//###### funcion donde la informacion ha sido validada y lista para enviar######## 
	}

    $('table.display').DataTable(  ); 
} );


function extraersDatosdeBD(){

		var parametro="codigo=14";

	$.ajax({
		
		url:"usuario/",
		//Tambien se puede utilizar el siguiente patron:
		//url:"/mensajes/"+$("#slc-usuario").val()+"/"+codigoContacto,
		data: parametro,
		method:"POST",
		dataType:"json",
		success:function(respuesta){
            for(var i=0;i<respuesta.length;i++){
                            console.log(respuesta[i]);
							$("#txtNames").val(respuesta[i].nombres);
							$("#txtLastname").val(respuesta[i].apellidos);
							$("#txtEmail").val(respuesta[i].telefono);
							$("#txtPhone").val(respuesta[i].correo);
							$("#txtPassword").val();
							$("#txtPassword").val();
            }
			

			}
		,
		error:function(e){
			alert("Error: " + JSON.stringify(e));
		}
	} );


}

