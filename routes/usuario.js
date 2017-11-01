var express = require('express');
var bodyParser = require("body-parser");
var sha512 = require('sha512');

var router = express.Router();

var urlEncodeParser = bodyParser.urlencoded({
  extended: false
});

router.use(bodyParser.json());


realizarQueryCB = require('../modulos/conexion').realizarQueryCB;

router.get('/',function(peticion,repuesta){
	
	

});


router.get('/getdatos',function(peticion,respuesta){
	console.log("consiguiendo datos");
	
	var sql = "SELECT codUsuario as codigo, nombres, apellidos, correo, telefono, contrasena FROM tblUsuarios WHERE codUsuario=?";
    var values = [peticion.query.codigo];
    
    realizarQueryCB(sql, values, function(data){
         respuesta.send(data);

     });

});





module.exports=router;
