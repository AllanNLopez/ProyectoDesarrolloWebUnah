function refreshWishlist() {

  $.ajax({
    url: "refreshWishlist/"+getCookie("codigo"),
    method: "POST",
    data: '',
    crossDomain: true,
    dataType: "json",
    contentType: "application/json",
    success: function(respuesta) {
      if(respuesta.length>0){
        $('#wsNotification').html(respuesta[0].totalItems);
      }
    },
    error: function(e) {
      alert("Ocurrio un error.");
      console.log(JSON.stringify(e));
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
