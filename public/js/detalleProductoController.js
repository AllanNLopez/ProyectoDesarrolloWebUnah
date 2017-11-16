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

$(document).ready(function() {

  refreshWishlist();

  $.ajax({
    url: "getItemSeleccionado/"+getCookie('codigoArticulo'),
    method: "POST",
    data: '',
    crossDomain: true,
    dataType: "json",
    contentType: "application/json",
    success: function(respuesta) {
      if(respuesta.length>0){
        $('#nombreArticulo').html(' '+respuesta[0].nombre);
        $('#precio').html('L '+respuesta[0].precio);
        $('#descripcion').html(' '+respuesta[0].descripcion);
      }
      for (var i = 0; i < respuesta.length; i++) {
        if (i==0) {
          $('#caInner').prepend(
          `<div class="active item" data-slide-number="`+i+`">
            <img src="`+respuesta[i].imagen+`" class="img-responsive slider-img center-block">
          </div>`);
        } else {
          $('#caInner').append(
          `<div class="item" data-slide-number="`+i+`">
            <img src="`+respuesta[i].imagen+`" class="img-responsive slider-img center-block">
          </div>`);
        }


        $('#uLista').prepend(`<li><a id="carousel-selector-`+i+`">
          <img src="`+respuesta[i].imagen+`" class="img-responsive slider-img-small" >
          </a>
        </li>`);
      }

      cargarDetalles();
    },
    error: function(e) {
      alert("Ocurrio un error.");
      console.log(JSON.stringify(e));
    }
  });
});

function cargarDetalles(){
  $.ajax({
    url: "getDetallesSeleccionado/"+getCookie('codigoArticulo'),
    method: "POST",
    data: '',
    crossDomain: true,
    dataType: "json",
    contentType: "application/json",
    success: function(respuesta) {
      for (var i = 0; i < respuesta.length; i++) {
        $('#tablaDetalles').append(
        `<tr>
          <td>`+respuesta[i].detalle+`</td>
          <td>`+respuesta[i].valor+`</td>
        </tr>`);
      }
    },
    error: function(e) {
      alert("Ocurrio un error.");
      console.log(JSON.stringify(e));
    }
  });
}
