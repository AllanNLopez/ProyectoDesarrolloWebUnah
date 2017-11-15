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

