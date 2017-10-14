
//variables globales
var id=0;

//inicializa la tabla con la que funciona el carrito de compras
table= $('#carrito').DataTable({
    "dom": '<"toolbar">frtip',
    "paging": false
  });

  $
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

  $("#btn-billbox").on( "click", function() {	 
    $('#billbox-body').toggle("1000");
  });

  $('#carrito').on( 'click', 'tr', function () {
    id = table.row( this ).id(); 
    console.log( $('#t'+id).html());
    console.log( $('#sel'+id).val());
    console.log(id);
    
  } ); 

  $('#btn-to-drop').click(function(){
      $('.hidden').removeClass('hidden'); 
      $(this).addClass('hidden');
  });

  $('#btn-cancel-drop').click(function(){
      $('.flotante').addClass('hidden');
      $('#btn-drop-items').addClass('hidden');
      $(this).addClass('hidden');
      $('#btn-to-drop').removeClass('hidden');
  });
  
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
      
  } );