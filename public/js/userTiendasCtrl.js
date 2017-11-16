
var codRubroTemp = 0;
var rubroTemp = 0;

$('#btnAddDetalle').click(function(){
    $('#tblDetalles').append('<tr><td>Detalle x</td><td>Valor de x</td></tr>');
});

$('#slcMisTiendas').change(function(){
    //segun el codigo de la tienda cargamos los articulos...  
    $('#selDepartamentos').html("<option value='0'>Seleccione un departamento</option>"); 
    getStoreInfo($('#slcMisTiendas').val());
});

$('#selDepartamentos').change(function(){
    $('#selCategorias').html("<option value='0'>Seleccione una categoria</option>"); 
    getStoreCategory($('#selDepartamentos').val());
});

function getStoreInfo(codEmpresa){
    var parametros ="codEmpresa="+codEmpresa;
	$.ajax({
		url:"/user/getStoreInfo",
		method:"POST",
		data:parametros,
		dataType:"json",
		success:function(respuesta){ 
            console.log(respuesta);
			if(respuesta != null){  
               $('#txtRTN').val(respuesta[0].rtn);
               $('#txtEmpresa').val(respuesta[0].nombreEmpresa); 
               $('#txtPhone').val(respuesta[0].telefono);
               $('#txtWebsite').val(respuesta[0].sitioweb); 
               $('#txtDomicilio').val(respuesta[0].ubicacion);
               $('#txtDescripcion').val(respuesta[0].informacion); 
               $('#txtRubro').val(respuesta[0].rubro); 
               getStoreDepartments(respuesta[0].codRubro);
               //codRubroTemp = respuesta[0].codRubro;
			}		
		},
		error:function(respuesta){
			alert("Hubo un error");
		}
	});
}

function getStoreProducts(){

}

function getStoreDepartments(codRubro){
    var parametros ="codigoRubro="+codRubro;
	$.ajax({
		url:"/user/getDepartamentos",
		method:"POST",
		data:parametros,
		dataType:"json",
		success:function(respuesta){ 
			if(respuesta.length>0){ 
                for (let i = 0; i < respuesta.length; i++) {
                    $('#selDepartamentos').append('<option value="'+respuesta[i].codDepartamento+'">'+respuesta[i].departamento+'</option>');
                }
			}else
            $('#selDepartamentos').append('<option>No hay departamentos</option>');		
		},
		error:function(respuesta){
			alert("Hubo un error");
		}
	});
}

function getStoreCategory(codDepartamento){
    var parametros ="codigoDepartamento="+codDepartamento;
	$.ajax({
		url:"/user/getCategorias",
		method:"POST",
		data:parametros,
		dataType:"json",
		success:function(respuesta){ 
			if(respuesta.length>0){ 
                for (let i = 0; i < respuesta.length; i++) {
                    $('#selCategorias').append('<option value="'+respuesta[i].codCategoria+'">'+respuesta[i].categoria+'</option>');
                }
			}else
            $('#selCategorias').append('<option>No hay categorias</option>');		
		},
		error:function(respuesta){
			alert("Hubo un error");
		}
	});
}

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
                    $('#slcMisTiendas').append('<option value="'+respuesta[i].codEmpresa+'" name="nombre">'+respuesta[i].nombreEmpresa+'</option>');
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