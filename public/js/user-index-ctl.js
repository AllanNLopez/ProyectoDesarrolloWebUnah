
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
		extraersDatosdeBD();
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
		

		// removi el atributo "hiden" en la archivo user/index.html 
		var camposValidos =	validarCampo($("#txtNames").val(), "nombre", "txtNames")&&
							validarCampo($("#txtLastname").val(), "apellido", "txtLastname")&&
							validarCampo($("#txtEmail").val(), "email", "txtEmail")&&
							validarCampo($("#txtPhone").val(), "phone", "txtPhone")&&
							validarCampo($("#txtPassword").val(), "password", "txtPassword");
						
		
		if( camposValidos){
			console.log("campos validos");
			
			actualizarDatosUsuario()
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

//Funcion para obtener datos de una cookie
//Las cookies definidas en routes/auth.js son
//codigo: codigo del usuario
//tipo_acceso: codigo de acceso para 3 tipos de usuario
//Para obtener codigo de usuario
//var user = getCookie("codigo");
//Para obtener el tipo de acceso
//var access = getCookie("tipo_acceso");
function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

//Cerrar sesion
$("#btn-logout").click(function(){
    $.ajax({
        url: "auth/logout",
        method: "GET",
        data: '',
        dataType: "json",
        success: function (respuesta) {
            if(respuesta.status == 1){
                window.location.href="../index.html";
                alert(respuesta.mensaje);
            }
        },
        error: function (e) {
            alert("Ocurrio un error.");
            console.log(JSON.stringify(e));
        }
    });
});


function extraersDatosdeBD(){
        
		var parametro="codigo="+getCookie("codigo");

	$.ajax({
		
		url:"usuario/",
		//Tambien se puede utilizar el siguiente patron:
		//url:"/mensajes/"+$("#slc-usuario").val()+"/"+codigoContacto,
		data: parametro,
		method:"POST",
		dataType:"json",
		success:function(respuesta){
            //console.log(respuesta);
            for(var i=0;i<respuesta.length;i++){
                           // console.log(respuesta[i]);
							$("#txtNames").val(respuesta[i].nombres);
							$("#txtLastname").val(respuesta[i].apellidos);
							$("#txtEmail").val(respuesta[i].correo);
							$("#txtPhone").val(respuesta[i].telefono);
							$("#txtPassword").val("");
							$("#txtPasswordConfirm").val("");
            }
			

			}
		,
		error:function(e){
			alert("Error: " + JSON.stringify(e));
		}
	} );


}



function actualizarDatosUsuario(){
        
		var parametro="codigo="+getCookie("codigo")+"&"+
					  "nombre="+$("#txtNames").val()+"&"+
					  "apellido="+$("#txtLastname").val()+"&"+
					  "email="+$("#txtEmail").val()+"&"+
					  "telefono="+$("#txtPhone").val()+"&"+
					  "contrasena="+$("#txtPassword").val();
						

	$.ajax({
		
		url:"usuario/actualizarInfo",
		//Tambien se puede utilizar el siguiente patron:
		//url:"/mensajes/"+$("#slc-usuario").val()+"/"+codigoContacto,
		data: parametro,
		method:"POST",
		dataType:"json",
		success:function(respuesta){
			if (respuesta.affectedRows == 1) {
            alert("Datos Actualizados Exitosamente")
            extraersDatosdeBD();
			}

			}
		,
		error:function(e){
			alert("Error: " + JSON.stringify(e));
		}
	} );


}


function obtenerOrdenesUsuario(){
        
		var parametro="codigo="+getCookie("codigo");
						

	$.ajax({
		
		url:"usuario/actualizarInfo",
		//Tambien se puede utilizar el siguiente patron:
		//url:"/mensajes/"+$("#slc-usuario").val()+"/"+codigoContacto,
		data: parametro,
		method:"POST",
		dataType:"json",
		success:function(respuesta){
			if (respuesta.affectedRows == 1) {
            alert("Datos Actualizados Exitosamente")
            extraersDatosdeBD();
			}

			}
		,
		error:function(e){
			alert("Error: " + JSON.stringify(e));
		}
	} );


}