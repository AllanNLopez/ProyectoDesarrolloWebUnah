var express = require('express');
var bodyParser = require("body-parser");
var sha512 = require('sha512');
var session = require("express-session");

var realizarQuery = require('../modulos/conexion').realizarQuery;

var router = express.Router();
var urlEncodeParser = bodyParser.urlencoded({
  extended: false
});



router.use(bodyParser.json());
var publicAdmin = express.static("public-admin");

router.post("/signin", urlEncodeParser, function(request, response) {
    var hash = sha512(request.body.contrasena);
    var pass = hash.toString('hex');
    var sql = "SELECT codUsuario, nombres, apellidos, telefono, correo, contrasena, codTipoUsuario FROM tblusuarios WHERE correo=? and contrasena=?";
    var values = [request.body.correo, pass];
    
    realizarQuery(sql,values, function(res){
        response.send(res);
    });
    
});

function verificarAutenticacion(peticion, respuesta, next){
	if(peticion.session.codigo)
		return next();
	else
		respuesta.send("ERROR, ACCESO NO AUTORIZADO");
}

router.use(session({secret:'Hola',resave:true,saveUninitialized:true}));

router.use(function(peticion,respuesta,next){
	if (peticion.session.usuario)
		publicAdmin(peticion,respuesta,next);
	else
		return next();
});


router.post("/login", urlEncodeParser, function(peticion, respuesta){
		if(peticion.body.codigo !== '' && peticion.body.tipo !== ''){
			peticion.session.codigo = peticion.body.codigo;
			peticion.session.tipo = peticion.body.tipo;
			respuesta.send({status:1,mensaje:"Accedio correctamente"});
		}else{
			peticion.session.destroy();
			respuesta.send({status:0,mensaje:"401 Acceso no autorizado"});
		}
		
});

router.get("/logout", function(peticion, respuesta){
		peticion.session.destroy();
		respuesta.sendFile(__dirname+"/public/index.html");
});

router.get("/ruta-segura1",verificarAutenticacion,function(peticion, respuesta){
	respuesta.send("Ruta 1. No se deberia visualizar o acceder a esta ruta si no esta autenticado");
});

router.get("/ruta-segura2",verificarAutenticacion,function(peticion, respuesta){
	respuesta.send("Ruta 2: No se deberia visualizar o acceder a esta ruta si no esta autenticado");
});

router.get("/get-session",function(peticion, respuesta){
	respuesta.send(JSON.stringify(peticion.session));
});

router.get("/set-session",function(peticion, respuesta){
	peticion.session.usuario = 'pmartinez';
	peticion.session.password = sha1('asd.456');
	respuesta.send("Se creo la session: " + JSON.stringify(peticion.session));
});

module.exports = router;