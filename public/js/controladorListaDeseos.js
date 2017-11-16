/*var dataSet = [
    ['<img src="http://qnimate.com/wp-content/uploads/2014/03/images2.jpg" width="200px" style="height: 100px;">', "Tiger Nixon", "System Architect", "Edinburgh", "5421", "2011/04/25", "$320,800"]
];*/

$(document).ready(function() {
  /*$('#carrito').DataTable( {
      data: dataSet,
      columns: [
          { title: "Name" },
          { title: "Position" },
          { title: "Office" },
          { title: "Extn." },
          { title: "Start date" },
          { title: "Salary" },
          { title: "Imagen"}
      ]
  });*/

  refreshWishlist();
  $.ajax({
    url: "listaDeseos/",
    method: "POST",
    data: '',
    crossDomain: true,
    contentType: 'application/json',
    dataType: "json",
    success: function(respuesta) {
      var data = [];
      var imagen;
      for (var i = 0; i < respuesta.length; i++) {
        data[i] = [];
        if(respuesta[i].imagen){
          data[i][0] = '<img src="'+respuesta[i].imagen+'" width="200px" style="height: 150px;">';
        } else {
          data[i][0] = '<img src="../img/default.png" width="200px" style="height: 150px;">';
        }
        data[i][1] = respuesta[i].nombre;
        data[i][2] = respuesta[i].precio;
        data[i][3] = respuesta[i].descripcion;
        data[i][4] = respuesta[i].origen;
      }
      $('#carrito').DataTable( {
          data: data,
          columns: [
              { title: "Imagen" },
              { title: "Nombre" },
              { title: "Precio" },
              { title: "Descripcion" },
              { title: "Origen" }
          ]
      });
    },
    error: function(e) {
      alert("Ocurrio un error.");
      console.log(JSON.stringify(e));
    }
  });
});
