/*
*Si un usuario ya ha iniciado sesion, al darle click en el boton acceder redirige a catalogo
*De lo contrario redirige a login
*/
$(document).ready(function() {

        $.ajax({
		
		url:"auth/get-session",
		data: '',
		method:"GET",
		dataType:"json",
		success:function(respuesta){
            window.location.replace("../catalogo");
        },
		error:function(e){
			console.log("Error: " + JSON.stringify(e));
		}
      });
    
});

