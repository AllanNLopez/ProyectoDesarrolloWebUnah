
$('#btnAddDetalle').click(function(){
    $('#tblDetalles').append('<tr><td>Detalle x</td><td>Valor de x</td></tr>');
});

function cargarTiendas(){
    var parametros ="codigoUsuario="+getCookie("codigo");
	$.ajax({
		url:"/user/getTiendas",
		method:"POST",
		data:parametros,
		dataType:"json",
		success:function(respuesta){ 
			if(respuesta.length>0){ 
                for (let i = 0; i < respuesta.length; i++) {
                    $('#slcMisTiendas').append('<option value="'+respuesta[i].codEmpresa+'">'+respuesta[i].nombreEmpresa+'</option>');
                }
			}else
            $('#slcMisTiendas').append('<option>No hay tiendas</option>');		
		},
		error:function(respuesta){
			alert("Hubo un error");
		}
	});
}



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

$(document).ready(function(){
    cargarTiendas();
});