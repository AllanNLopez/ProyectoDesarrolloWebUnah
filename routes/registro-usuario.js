/*
 * En este archivo utilizamos sha512 que nos servira para encriptar las
 * contraseñas antes de almacenarlas.
 */
var express = require('express');
var bodyParser = require("body-parser");
var sha512 = require('sha512');
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

router.post("/", urlEncodeParser, function(request, response) {

  var hash = sha512(request.body.txtPassword);
  var contrasena = hash.toString('hex');
  var codTipoUsuario = 1;
  var sql = "INSERT INTO tblusuarios(nombres,apellidos,telefono,correo,contrasena,codTipoUsuario) VALUES(?,?,?,?,?,?)";
  var values = [request.body.txtNames,
    request.body.txtLastname,
    request.body.txtPhone,
    request.body.txtEmail,
    contrasena,
    codTipoUsuario
  ];
  //Utilizamos la funcion realizarQuery que importamos, recibe como parametros
  //una sentencia sql y un arreglo con los parametros ? de la sentencia misma.
  realizarQuery(sql, values);
});

module.exports = router;
