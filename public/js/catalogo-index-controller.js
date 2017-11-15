$( document ).ready(function() {
  $.ajax({
      url: "cargarLista/",
      method: "POST",
      data: '',
      crossDomain: true,
      contentType: 'application/json',
      dataType: "json",
      success: function(respuesta) {

        var totalPaginas = 0;
        var imagen, lastID;

        $('#rejillaItems').html('');
        // console.log(respuesta.length);
        // console.log(respuesta.length/8);
        for (var i = 0; i < respuesta.length; i++) {

          if(i%8 == 0){
            totalPaginas = totalPaginas + 1;
            if(i==0){
              $('#rejillaItems').append(`<div id="page-content-`+totalPaginas+`" class="page-content"></div>`);
            }
            else {
              $('#rejillaItems').append(`<div id="page-content-`+totalPaginas+`" class="page-content oculto"></div>`);
            }
          }

          if(!respuesta[i].imagen){
              imagen = '../img/default.png';
          }
          else {
            imagen = respuesta[i].imagen;
          }
      
          $('#page-content-'+totalPaginas).append(`<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 cols-margin">
            <div class="panel panel-default nopadding  ">
            <div class="store-btn-addtocart">
                <button type="button" class="btn btn-sm">add</button>
                <button type="button" class="btn btn-sm">add</button>
            </div>
            <img class="store-article-img" src="`+imagen+`" width="100%" style="height: 280px;">
                <div class="panel-body nopadding">
                   <div class="cart-offer-title">`+respuesta[i].nombre+`</div>
                   <div class="cart-offer-vendor">
                    <span class="badge cart-offer-badge">Marca</span>
                    <span class="badge cart-offer-badge">Expreso americano</span>
                    <span class="badge cart-offer-badge-off">Oferta</span>
                  </div>
                  <div class="store-article-price">L. `+respuesta[i].precio+`</div>
                  <div class="store-article-goto">
                    <a tabindex="0" class="btn btn-success" role="button" data-toggle="popover" data-trigger="focus"
                       data-html="true" data-placement="top"
                       data-content='
                        <div class="btn-group-vertical" role="group">
                          <button type="button" class="btn btn-success "><i class="fa fa-cart-plus" aria-hidden="true"></i> Añadir al carrito</button>
                        </div>
                        <div class="btn-group-vertical" role="group">
                            <button type="button" class="btn btn-success "><i class="fa fa-cart-plus" aria-hidden="true"></i> Añadir mis deseos</button>
                          </div>
                       '>
                      35 min <i class="fa fa-chevron-right" aria-hidden="true"></i>
                    </a>
                  </div>
                </div>
            </div>
          </div>`);
        }
        setNumPages(totalPaginas);
        console.log(respuesta.length/6);
      },
    error: function(e) {
      alert("Ocurrio un error.");
      console.log(JSON.stringify(e));
    }
  });
});

function setNumPages(numeroPaginas){
  $('#pagination').twbsPagination({
          totalPages: numeroPaginas,
          visiblePages: 3,
          next: 'Next',
          prev: 'Prev',
          onPageClick: function (event, page) {
              $('.page-content').addClass('oculto');
              $('#page-content-'+page).removeClass('oculto');
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