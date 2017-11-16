var expanded = 'Filtrar Categorias';

$(document).ready(function() {
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

      for (var i = 0; i < respuesta.length; i++) {

        if (i % 8 == 0) {
          totalPaginas = totalPaginas + 1;
          if (i == 0) {
            $('#rejillaItems').append(`<div id="page-content-` + totalPaginas + `" class="page-content"></div>`);
          } else {
            $('#rejillaItems').append(`<div id="page-content-` + totalPaginas + `" class="page-content oculto"></div>`);
          }
        }

        if (!respuesta[i].imagen) {
          imagen = '../img/default.png';
        } else {
          imagen = respuesta[i].imagen;
        }

        $('#page-content-' + totalPaginas).append(`<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 cols-margin" style="height:430px">
            <div class="panel panel-default nopadding  ">
            <div class="store-btn-addtocart">
                <button type="button" class="btn btn-sm">add</button>
                <button type="button" onclick="agregarToWishlist(` + respuesta[i].codigoArticulo + `)" class="btn btn-sm"><span class="fa fa-gift" aria-hidden="true"></button>
            </div>
            <img class="store-article-img" src="` + imagen + `" width="100%" style="height: 280px;">
                <div class="panel-body nopadding">
                   <div class="cart-offer-title">` + respuesta[i].nombre + `</div>
                   <div class="cart-offer-vendor" id="detalleArticulo` + respuesta[i].codigoArticulo + `">
                    <!--<span class="badge cart-offer-badge-off">Oferta</span>-->
                  </div>
                  <div class="store-article-price">L. ` + respuesta[i].precio + `</div>
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
      cargarDetalles();
    },
    error: function(e) {
      alert("Ocurrio un error.");
      console.log(JSON.stringify(e));
    }
  });

  $.ajax({
    url: "cargarListaDepartamento/",
    method: "POST",
    data: '',
    crossDomain: true,
    contentType: 'application/json',
    dataType: "json",
    success: function(respuesta) {
      for (var i = 0; i < respuesta.length; i++) {
        $('#selectDepartamento').append(`<option value="` + respuesta[i].codigo + `">` + respuesta[i].rubro + `</option>`);
      }
    },
    error: function(e) {
      alert("Ocurrio un error.");
      console.log(JSON.stringify(e));
    }
  });

  $.ajax({
    url: "cargarCategorias/",
    method: "POST",
    data: '',
    crossDomain: true,
    contentType: 'application/json',
    dataType: "json",
    success: function(respuesta) {
      for (var i = 0; i < respuesta.length; i++) {
        $('#divCategorias').append(`<div class="checkbox">
        <label><input type="checkbox" onchange="change_checkbox()" name="checkbox" value="` + respuesta[i].codigo + `">` + respuesta[i].categoria + `</label>
        </div>`);
      }
    },
    error: function(e) {
      alert("Ocurrio un error.");
      console.log(JSON.stringify(e));
    }
  });
  refreshWishlist();
});

function cargarDetalles() {
  $.ajax({
    url: "cargarDetalles/",
    method: "POST",
    data: '',
    crossDomain: true,
    contentType: 'application/json',
    dataType: "json",
    success: function(respuesta) {
      for (var i = 0; i < respuesta.length; i++) {
        $('#detalleArticulo' + respuesta[i].codArticulo).append(`<span class="badge cart-offer-badge" style="margin-left: 5px;">` +
          respuesta[i].detalle + ` ` + respuesta[i].valor + `</span>`);
      }
    },
    error: function(e) {
      alert("Ocurrio un error.");
      console.log(JSON.stringify(e));
    }
  });
}

function setNumPages(numeroPaginas) {
  $('#pagination').twbsPagination({
    totalPages: numeroPaginas,
    visiblePages: 3,
    next: 'Next',
    prev: 'Prev',
    onPageClick: function(event, page) {
      $('.page-content').addClass('oculto');
      $('#page-content-' + page).removeClass('oculto');
    }
  });
}

$('input[type=radio]').click(function() {
  cargarProductosParametrizados(this.value);
});

$('#opcionMostrar').change(function() {

  if (expanded == 'Filtrar por Precio') {
    var valorRadio;
    try {
      valorRadio = document.querySelector('input[type="radio"]:checked').value;
    } catch (err) {}
    cargarProductosParametrizados(valorRadio);
  } else if (expanded == 'Filtrar Categorias') {
    cargarListaDepartamento();
  }
});

$('#btnBuscarPrecio').click(function() {
  var data = {
    valor1: $('#precioMin').val(),
    valor2: $('#precioMax').val(),
    select: $('#opcionMostrar').val()
  }
  if (/^[1-9]\d*(\.\d+)?$/.test($('#precioMin').val()) && /^[1-9]\d*(\.\d+)?$/.test($('#precioMax').val())) {
    $.ajax({
      url: "cargarPorPrecioParam/",
      method: "POST",
      data: data,
      crossDomain: true,
      dataType: "json",
      success: function(respuesta) {
        cargarProductos(respuesta);
        $('#precioMin').val('');
        $('#precioMax').val('');
        $("input:radio").attr("checked", false);
      },
      error: function(e) {
        alert("Ocurrio un error.");
        console.log(JSON.stringify(e));
      }
    });
  }
});

function cargarProductosParametrizados(valorRadio) {
  var data = {
    opcion: valorRadio,
    select: $('#opcionMostrar').val()
  }

  $.ajax({
    url: "cargarPorPrecio/",
    method: "POST",
    data: data,
    crossDomain: true,
    dataType: "json",
    success: function(respuesta) {
      cargarProductos(respuesta);
    },
    error: function(e) {
      alert("Ocurrio un error.");
      console.log(JSON.stringify(e));
    }
  });
}


function cargarProductos(respuesta) {
  var totalPaginas = 0;
  var imagen, lastID;

  $('#rejillaItems').html('');

  for (var i = 0; i < respuesta.length; i++) {

    if (i % 8 == 0) {
      totalPaginas = totalPaginas + 1;
      if (i == 0) {
        $('#rejillaItems').append(`<div id="page-content-` + totalPaginas + `" class="page-content"></div>`);
      } else {
        $('#rejillaItems').append(`<div id="page-content-` + totalPaginas + `" class="page-content oculto"></div>`);
      }
    }

    if (!respuesta[i].imagen) {
      imagen = '../img/default.png';
    } else {
      imagen = respuesta[i].imagen;
    }

    $('#page-content-' + totalPaginas).append(`<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 cols-margin" style="height:430px">
      <div class="panel panel-default nopadding  ">
      <div class="store-btn-addtocart">
          <button type="button" class="btn btn-sm">add</button>
          <button type="button" class="btn btn-sm" onclick="agregarToWishlist(` + respuesta[i].codigoArticulo + `)"><span class="fa fa-gift" aria-hidden="true"></button>
      </div>
      <img class="store-article-img" src="` + imagen + `" width="100%" style="height: 280px;">
          <div class="panel-body nopadding">
             <div class="cart-offer-title">` + respuesta[i].nombre + `</div>
             <div class="cart-offer-vendor" id="detalleArticulo` + respuesta[i].codigoArticulo + `">
              <!--<span class="badge cart-offer-badge-off">Oferta</span>-->
            </div>
            <div class="store-article-price">L. ` + respuesta[i].precio + `</div>
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

  try {
    $('#pagination').twbsPagination("destroy");
    setNumPages(totalPaginas);
  } catch (err) {

  }
  cargarDetalles();
}

function change_checkbox() {
  cargarListaDepartamento();
}

$('#selectDepartamento').on('change', function() {
  cargarListaDepartamento();
});

function cargarListaDepartamento() {

  var yourArray = [];
  $("input:checkbox[name=checkbox]:checked").each(function() {
    yourArray.push($(this).val());
  });

  var departamento = $(selectDepartamento).val();
  var data = {
    departamento: departamento,
    opcion: yourArray,
    select: $('#opcionMostrar').val()
  }

  $.ajax({

    url: "cargarPorCategoria/",
    method: "POST",
    data: JSON.stringify(data),
    crossDomain: true,
    dataType: "json",
    contentType: "application/json",
    success: function(respuesta) {
      cargarProductos(respuesta);
    },
    error: function(e) {
      alert("Ocurrio un error.");
      console.log(JSON.stringify(e));
    }
  });
}

function setExpanded(valor) {
  expanded = valor;
}

function agregarToWishlist(valor) {
  var data = {
    codigoArticulo: valor
  }

  $.ajax({
    url: "agregarToWishlist/"+$.cookie("codigo"),
    method: "POST",
    data: JSON.stringify(data),
    crossDomain: true,
    dataType: "json",
    contentType: "application/json",
    success: function(respuesta) {
      if (respuesta.affectedRows == 1) {
        alert('Item agregado a la lista de deseos');
        refreshWishlist();
      }
    },
    error: function(e) {
      alert("Ocurrio un error.");
      console.log(JSON.stringify(e));
    }
  });

}


function refreshWishlist() {

  $.ajax({
    url: "refreshWishlist/"+$.cookie("codigo"),
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
