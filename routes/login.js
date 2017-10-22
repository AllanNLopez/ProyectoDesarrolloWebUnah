var express = require('express');
var mysql = require('../modulos/conexion');
var bodyParser = require("body-parser");
var app = express();
var router = express.Router();
var urlEncodeParser = bodyParser.urlencoded({extended:false});

router.use(bodyParser.json());

router.post("/registro-usuario",urlEncodeParser,function(request, response){
  console.log(request.body.txtNames);
  console.log(request.body.txtLastname);
  console.log(request.body.txtEmail);
  console.log(request.body.txtPhone);
  console.log(request.body.txtPassword);
});

/*
app.post("/login",urlEncodeParser,function(peticion, respuesta){
	var resultado ={
		usuario:peticion.body.usuario,
		contrasena:peticion.body.contrasena
	};

	respuesta.send(JSON.stringify(resultado));
});

app.get("/query",function(peticion, respuesta){
	conexion.query("SELECT codigo_usuario, nombre, fotografia FROM tbl_usuarios", function(err, filas, campos){
		var resultado = "";
		for (var i = 0; i < filas.length; i++) {
			resultado+="Nombre: "+filas[i].nombre+"<br>";
		}
		respuesta.writeHead(200,{"Content-Type":"text/html"});
		respuesta.write(resultado);
		respuesta.end();

	});
});
*/
module.exports = router;
