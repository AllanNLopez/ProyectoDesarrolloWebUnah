/*
 * En este archivo utilizamos sha512 que nos servira para encriptar las
 * contraseñas antes de almacenarlas.
 */
var express = require('express');
var bodyParser = require("body-parser");
/*
 * Importamos la funcion realizarQuery para facilitar la insercion de informacion
 * en la base de datos
 */
var realizarQuery = require('../modulos/conexion').realizarQuery;
/*
 * Creamos una funcion router que exportaremos luego que nos permitira importarla
 * en otros archivos.
 */
var router = express.Router();
var urlEncodeParser = bodyParser.urlencoded({
  extended: false
});

router.use(bodyParser.json());

router.post("/cargarLista", urlEncodeParser, function(request, response) {

  var sql = `SELECT A.codArticulo as codigoArticulo,
  		MAX(tblimagenesarticulo.urlUbicacion) as imagen,
          A.nombreArticulo as nombre,
  		A.descripcion as descripcion,
          A.precio as precio,
          A.origenFabricacion as origen,
          A.saldo as saldo,
          A.fechaPublicacion as fecha,
          A.estado as estado,
          A.codCategoria as codigoCategoria,
          A.codUsuarioPublicador as codUsuarioPublicador
  FROM tblarticulos AS A
  LEFT JOIN tblimagenesarticulo ON tblimagenesarticulo.codArticulo = A.codArticulo
  GROUP BY A.codArticulo`;

  /*
  var sql = `select codArticulo, codDetalle, valor
  from
  (
     select codArticulo, codDetalle, valor,
        (@num:=if(@group = codArticulo, @num +1, if(@group := codArticulo, 1, 1))) row_number
    from tbldetallesarticulo t
    CROSS JOIN (select @num:=0, @group:=null) c
    order by codArticulo, codDetalle desc, valor
  ) as x
  where x.row_number <= 1`;
*/
  var values = [];
  //Utilizamos la funcion realizarQuery que importamos, recibe como parametros
  //una sentencia sql y un arreglo con los parametros ? de la sentencia misma.
  //realizarQuery(sql, values);
  realizarQuery(sql, values, function(res) {
    response.send(res);
  });
});

router.post("/cargarDetalles", urlEncodeParser, function(request, response) {
  var sql = `select codArticulo, x.codDetalle, valor, A.detalle as detalle
  from
  (
     select codArticulo, codDetalle, valor,
        (@num:=if(@group = codArticulo, @num +1, if(@group := codArticulo, 1, 1))) row_number
    from tbldetallesarticulo t
    CROSS JOIN (select @num:=0, @group:=null) c
    order by codArticulo, codDetalle desc, valor
  ) as x
  INNER join tbldetalles A ON A.codDetalle = x.codDetalle
  where x.row_number <= 2`;

  var values = [];

  realizarQuery(sql, values, function(res) {
    response.send(res);
  });

});

router.post("/cargarPorPrecio", urlEncodeParser, function(request, response) {
  var sql = `SELECT A.codArticulo as codigoArticulo,
  		    MAX(tblimagenesarticulo.urlUbicacion) as imagen,
          A.nombreArticulo as nombre,
  		    A.descripcion as descripcion,
          A.precio as precio,
          A.origenFabricacion as origen,
          A.saldo as saldo,
          A.fechaPublicacion as fecha,
          A.estado as estado,
          A.codCategoria as codigoCategoria,
          A.codUsuarioPublicador as codUsuarioPublicador
  FROM tblarticulos AS A
  LEFT JOIN tblimagenesarticulo ON tblimagenesarticulo.codArticulo = A.codArticulo`;
  var condicion;
  var values = [];

  switch (request.body.opcion) {
    case 'option1':
      condicion = `WHERE A.precio < '50' GROUP BY A.codArticulo`;
      break;
    case 'option2':
      condicion = `WHERE A.precio >= '50' AND A.precio < '100' GROUP BY A.codArticulo`;
      break;
    case 'option3':
      condicion = `WHERE A.precio >= '100' AND A.precio < '150' GROUP BY A.codArticulo`;
      break;
    case 'option4':
      condicion = `WHERE A.precio >= '150' AND A.precio < '200' GROUP BY A.codArticulo`;
      break;
    case 'option5':
      condicion = `WHERE A.precio >= '200' AND A.precio < '300' GROUP BY A.codArticulo`;
      break;
    case 'option6':
      condicion = `WHERE A.precio >= '300' AND A.precio < '500' GROUP BY A.codArticulo`;
      break;
    case 'option7':
      condicion = `WHERE A.precio >= '500' GROUP BY A.codArticulo`;
      break;
    default:
      condicion = `GROUP BY A.codArticulo`;
  }

  sql = sql + ' ' + condicion;

  switch (request.body.select) {
    case 'Precio descendente':
      condicion = `ORDER BY A.precio DESC`;
      break;
    case 'Precio ascendente':
      condicion = `ORDER BY A.precio ASC`;
      break;
    case 'Fecha':
      condicion = `ORDER BY A.fechaPublicacion`;
      break;
    default:
      condicion='';
  }

  sql = sql + ' ' + condicion;

  realizarQuery(sql, values, function(res) {
    response.send(res);
  });
});

router.post("/cargarPorPrecioParam", urlEncodeParser, function(request, response) {
  var sql = `SELECT A.codArticulo as codigoArticulo,
  		MAX(tblimagenesarticulo.urlUbicacion) as imagen,
          A.nombreArticulo as nombre,
  		A.descripcion as descripcion,
          A.precio as precio,
          A.origenFabricacion as origen,
          A.saldo as saldo,
          A.fechaPublicacion as fecha,
          A.estado as estado,
          A.codCategoria as codigoCategoria,
          A.codUsuarioPublicador as codUsuarioPublicador
  FROM tblarticulos AS A
  LEFT JOIN tblimagenesarticulo ON tblimagenesarticulo.codArticulo = A.codArticulo
  WHERE A.precio >= ? AND A.precio <= ? GROUP BY A.codArticulo`;

  var values = [request.body.valor1, request.body.valor2];
  var condicion;

  switch (request.body.select) {
    case 'Precio descendente':
      condicion = `ORDER BY A.precio DESC`;
      break;
    case 'Precio ascendente':
      condicion = `ORDER BY A.precio ASC`;
      break;
    case 'Fecha':
      condicion = `ORDER BY A.fechaPublicacion`;
      break;
    default:
      condicion='';
  }

  sql = sql + ' ' + condicion;

  realizarQuery(sql, values, function(res) {
    response.send(res);
  });
});

router.post("/cargarListaDepartamento", urlEncodeParser, function(request, response) {
  var sql = `SELECT A.rubro as rubro, B.codDepartamento as codigo
            FROM tblrubro A
            INNER JOIN tbldepartamentos B ON B.codRubro = A.codRubro`;
  var values = [];

  realizarQuery(sql, values, function(res) {
    response.send(res);
  });
});

router.post("/cargarCategorias", urlEncodeParser, function(request, response) {
  var sql = ` SELECT A.codCategoria as codigo, A.codDepartamento as codDepartamento, A.categoria as categoria
              FROM tblcategorias A`;
  var values = [];

  realizarQuery(sql, values, function(res) {
    response.send(res);
  });
});

router.post("/cargarPorCategoria", urlEncodeParser, function(request, response) {
  var sql = `SELECT A.codArticulo as codigoArticulo,
  		    MAX(tblimagenesarticulo.urlUbicacion) as imagen,
          A.nombreArticulo as nombre,
  		    A.descripcion as descripcion,
          A.precio as precio,
          A.origenFabricacion as origen,
          A.saldo as saldo,
          A.fechaPublicacion as fecha,
          A.estado as estado,
          A.codCategoria as codigoCategoria,
          A.codUsuarioPublicador as codUsuarioPublicador
  FROM tblarticulos AS A
  LEFT JOIN tblimagenesarticulo ON tblimagenesarticulo.codArticulo = A.codArticulo
  LEFT JOIN tblinfoarticulo ON A.codArticulo = tblinfoarticulo.codArticulo`;
  /*WHERE tblinfoarticulo.codCategoria = '1'
  OR tblinfoarticulo.codCategoria = '2'
  GROUP BY A.codArticulo`*/
  var values = [];
  var condicion;
  for (var i = 0; i < request.body.opcion.length; i++) {
    if(i==0){
      sql = sql + ' ' + 'WHERE tblinfoarticulo.codCategoria = ?';
      values.push(request.body.opcion[i]);
    }
    else {
      sql = sql + ' ' + 'OR tblinfoarticulo.codCategoria = ?';
      values.push(request.body.opcion[i]);
    }
  }

  if(request.body.departamento){
    if (request.body.opcion.length == 0) {
      sql = sql + ' ' + 'WHERE tblinfoarticulo.codDepartamento = ?';
    }
    else {
      sql = sql + ' ' + 'OR tblinfoarticulo.codDepartamento = ?';
    }
    values.push(request.body.departamento);
  }

  switch (request.body.select) {
    case 'Precio descendente':
      condicion = `ORDER BY A.precio DESC`;
      break;
    case 'Precio ascendente':
      condicion = `ORDER BY A.precio ASC`;
      break;
    case 'Fecha':
      condicion = `ORDER BY A.fechaPublicacion`;
      break;
    default:
      condicion='';
  }
  sql = sql + ' ' + 'GROUP BY A.codArticulo'+' '+condicion;
  realizarQuery(sql, values, function(res) {
    response.send(res);
  });
});

router.post("/agregarToWishlist/:codigo", urlEncodeParser, function(request, response) {
  var sql = ` INSERT INTO
              tbllistadeseos(colItem, codArticulo, codUsuario, fechaRegistro)
              VALUES(NULL,?,?,NOW())`;
  var values = [request.body.codigoArticulo, request.params.codigo];
  realizarQuery(sql, values, function(res) {
    response.send(res);
  });
});

router.post("/refreshWishlist/:codigo", urlEncodeParser, function(request, response) {
  var sql = ` SELECT COUNT(*) as totalItems
              FROM tbllistadeseos A
              WHERE A.codUsuario = ?`;
  var values = [request.params.codigo];
  realizarQuery(sql, values, function(res) {
    response.send(res);
  });
});


module.exports = router;
