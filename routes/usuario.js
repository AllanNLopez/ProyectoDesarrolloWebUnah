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

	//console.log("consiguiendo datos");
	var sql = "SELECT codUsuario as codigo, nombres, apellidos, telefono, correo, contrasena FROM tblusuarios WHERE codUsuario=?";
    var values = [peticion.body.codigo];
    //console.log(values);

    realizarQuery(sql, values, function(data){
         respuesta.send(data);
     });

});



router.post('/actualizarInfo', urlEncodeParser, function(peticion,respuesta){
	var hash = sha512(peticion.body.contrasena);
  	var contrasena = hash.toString('hex');
	//console.log("consiguiendo datos");
	var sql = "UPDATE tblusuarios SET nombres=?, apellidos=?, telefono=?, correo=?, contrasena=? WHERE codUsuario=?";
    var values = [peticion.body.nombre,
				  peticion.body.apellido,
				  peticion.body.telefono,
				  peticion.body.email,
				  contrasena,
				  peticion.body.codigo];
    //console.log(values);
    realizarQuery(sql, values, function(data){
         respuesta.send(data);
     });

});

router.post('/obtenerOrdenes', urlEncodeParser, function(peticion,respuesta){
	
	//console.log("consiguiendo datos");
	var sql = 'SELECT  DATE_FORMAT(A.fecha,"%d/%m/%Y") as fecha, CONCAT(C.nombres," ",C.apellidos) as nombreRepatidor, '+
					  'A.tiempoEstimado, A.cantArticulos, A.costoDeCompra, A.costoDeEntrega, A.costoOrden '+
			   'FROM  tblordenes AS A '+
			   'INNER JOIN tblarticulosordenados AS B '+
			   'ON(A.codUsuarioRepartidor) '+
			   'INNER JOIN tblusuarios AS C '+
			   'ON(A.codUsuarioRepartidor=C.codUsuario) '+
			   'WHERE A.codUsuarioCliente= ? ';
    var values = [peticion.body.codigo];
    
    //console.log(values);
    realizarQuery(sql, values, function(data){
    	//console.log(respuesta);
         respuesta.send(data);
     });

});



module.exports=router;
