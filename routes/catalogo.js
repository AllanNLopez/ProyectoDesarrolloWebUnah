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

  var sql = `SELECT 	A.codArticulo as codigoArticulo,
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
  var values = [];
  //Utilizamos la funcion realizarQuery que importamos, recibe como parametros
  //una sentencia sql y un arreglo con los parametros ? de la sentencia misma.
  //realizarQuery(sql, values);
  realizarQuery(sql, values, function(res) {
    response.send(res);
  });
});

module.exports = router;
