$(document).ready(function() {

        $.ajax({

		url:"auth/rutaSeguraCatalogo",
		data: '',
		method:"GET",
		dataType:"json",
		success:function(respuesta){
            if(respuesta.status == 1){
                console.log(respuesta.mensaje)
            }

        },
		error:function(e){
            window.location.replace("../index.html");
			console.log("Error: " + JSON.stringify(e));

		}
      });

});
