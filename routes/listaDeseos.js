
var express = require('express');
var bodyParser = require("body-parser");
var realizarQuery = require('../modulos/conexion').realizarQuery;

var router = express.Router();
var urlEncodeParser = bodyParser.urlencoded({
  extended: false
});

router.use(bodyParser.json());

router.post("/", urlEncodeParser, function(request, response) {

  var sql = ` SELECT A.codArticulo as codigoArticulo,
  		        MAX(tblimagenesarticulo.urlUbicacion) as imagen,
              A.nombreArticulo as nombre,
  		        A.descripcion as descripcion,
              A.precio as precio,
              A.origenFabricacion as origen,
              A.saldo as saldo,
              A.fechaPublicacion as fecha,
              A.estado as estado,
              A.codCategoria as codigoCategoria,
              A.codUsuarioPublicador as codUsuarioPublicado
  FROM tblarticulos AS A
  LEFT JOIN tblimagenesarticulo ON tblimagenesarticulo.codArticulo = A.codArticulo
  INNER JOIN tbllistadeseos C ON A.codArticulo = C.codArticulo
  WHERE C.codUsuario = '1'
  GROUP BY A.codArticulo`; //EDITAR IDUSUARIO CUANDO FUNCIONEN LAS SESSIONES

  var values = [];

  realizarQuery(sql, values, function(res) {
    response.send(res);
  });
});


module.exports = router;
