
//variables globales
var id=0;

$(document).ready(function() {
  //inicializa la tabla con la que funciona el carrito de compras
  table= $('#carrito').DataTable({
    "dom": '<"toolbar">frtip',
    "paging": false
  }); 

  $("div.toolbar").html(
    '<button type="button" id="btn-drop-items" class="btn hidden" >'
    +'<i class="fa fa-check" aria-hidden="true"></i>'
    +'</button>'
    +'<button type="button" id="btn-cancel-drop" class="btn hidden" >'
    +'<i class="fa fa-times" aria-hidden="true"></i>'
    +'</button>'
    +'<button type="button" id="btn-to-drop" class="btn" >'
    +'<i class="fa fa-trash" aria-hidden="true"></i>'
    +'</button>'
  );
  actualizarCuadroResumen();



  //funcion para mostrar u ocultar el cuadro resumen de orden
  $("#btn-billbox").on( "click", function() {	 
    $('#billbox-body').toggle("1000");
  });

  //captura de datos al dar click en una fila de la tabla
  $('#carrito').on( 'click', 'tr', function () {
    id = table.row( this ).id(); 
    actualizarCuadroResumen();
    
  } ); 

  // boton que muestra los checkboxs para luego eliminar elementos de la lista
  $('#btn-to-drop').click(function(){
      $('.hidden').removeClass('hidden'); 
      $(this).addClass('hidden');
  });

  //para cancelar la acción de eliminar elementos en la tabla 
  $('#btn-cancel-drop').click(function(){
      $('.flotante').addClass('hidden');
      $('#btn-drop-items').addClass('hidden');
      $(this).addClass('hidden');
      $('#btn-to-drop').removeClass('hidden');
  });

  //funcion que elimina los elementos seleccionados en la tabla
  $('#btn-drop-items').click( function () { 
    totalrows = table.rows().data().length;
    totalselected = 0; 
    for (var i = 0; i < totalrows; i++) {
      rid = table.row(i).id();
      if($('#chk'+rid).is(":checked")){ 
        totalselected++;
      }
    }

    while(totalselected !=0){
      for (var i = 0; i <totalrows; i++) {
        rid = table.row(i).id();
        if($('#chk'+rid).is(":checked")){
          table.row(i).remove().draw(false);
        }
      }
      totalrows--;
      totalselected--;
    }

    console.log("total:"+totalrows);
    console.log("seleccionadas:"+totalselected);

    //al finalizar  
    $('.flotante').addClass('hidden');
    $('#btn-drop-items').addClass('hidden');
    $('#btn-cancel-drop').addClass('hidden');
    $('#btn-to-drop').removeClass('hidden');
    actualizarCuadroResumen();
      
  } );

} ); //Fin del document ready

function getTotalArticulos(){
  totalrows = table.rows().data().length;
  totalArticulos =0;
  for (var i = 0; i < totalrows; i++) {
    rid = table.row(i).id();
    totalArticulos = totalArticulos + parseInt($('#sel'+rid).val());
  }  

  return totalArticulos;
}

function getTotalMinutos(){

}

function getTotalPagar(){
  totalrows = table.rows().data().length;
  montoTotal =0.0;
  for (var i = 0; i < totalrows; i++) {
    rid = table.row(i).id();
    montoTotal = montoTotal + parseFloat($('#lbl'+rid).html().slice(3));
  }  

  return montoTotal;
}


function actualizarCuadroResumen(){  
  $("#txtTotalArticulos").val(getTotalArticulos());
  $('#txtTotalPagar').val(getTotalPagar());
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