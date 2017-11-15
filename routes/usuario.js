var express = require('express');
var bodyParser = require("body-parser");
var sha512 = require('sha512');

var router = express.Router();

var urlEncodeParser = bodyParser.urlencoded({
  extended: false
});

router.use(bodyParser.json());

var realizarQuery = require('../modulos/conexion').realizarQuery;

router.post('/', urlEncodeParser, function(peticion,respuesta){
	console.log("consiguiendo datos");
	var sql = "SELECT codUsuario as codigo, nombres, apellidos, telefono, correo, contrasena FROM tblUsuarios WHERE codUsuario=?";
    var values = [peticion.body.codigo];
    realizarQuery(sql, values, function(data){
         respuesta.send(data);
     });

});



module.exports=router;
