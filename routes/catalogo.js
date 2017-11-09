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

  var sql =   `SELECT nombreArticulo as nombre,
              descripcion,
              precio,
              origenFabricacion as origen,
              saldo,
              fechaPublicacion,
              estado,
              codCategoria,
              codUsuarioPublicador as usuario,
              B.urlUbicacion as imagen,
              B.codArticulo as codigoArticulo
              FROM tblarticulos A
              LEFT JOIN tblimagenesarticulo B on A.codArticulo = B.codArticulo
              ORDER BY A.codArticulo ASC`;
  var values = [];
  //Utilizamos la funcion realizarQuery que importamos, recibe como parametros
  //una sentencia sql y un arreglo con los parametros ? de la sentencia misma.
  //realizarQuery(sql, values);
  realizarQuery(sql,values, function(res){
    response.send(res);
  });
});

module.exports = router;
