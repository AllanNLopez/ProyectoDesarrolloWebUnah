var express = require('express');
var bodyParser = require("body-parser");
var sha512 = require('sha512');

var session = require("express-session");
var cookieParser = require("cookie-parser");

var realizarQuery = require('../modulos/conexion').realizarQuery;

var router = express.Router();

var urlEncodeParser = bodyParser.urlencoded({
  extended: false
});

router.use(bodyParser.json());
router.use(cookieParser());
router.use(session({secret:'sesioncarry',resave:true,saveUninitialized:true}));

function verificarAutenticacion(peticion, respuesta, next){
	if(peticion.session.codigo)
		return next();
	else
		respuesta.send("NO HA INICIADO SESION: ERROR, ACCESO NO AUTORIZADO");
}

var catalogo = express.static("../catalogo");
//var user = express.static("../user");

router.use(function(peticion,respuesta,next){
	if (peticion.session.usuario)
		catalogo(peticion,respuesta,next);
	else
		return next();
});


router.post('/signin', urlEncodeParser, function(request, response) {
    var hash = sha512(request.body.contrasena);
    var pass = hash.toString('hex');
    var sql = "SELECT codUsuario as codigo, nombres, apellidos, telefono, correo, contrasena, codTipoUsuario as tipo FROM tblusuarios WHERE correo=? and contrasena=?";
    var values = [request.body.correo, pass];
    var valores;
    realizarQuery(sql,values, function(res){
        response.send(JSON.stringify(res));
    });
});

router.post("/login", urlEncodeParser, function(peticion, respuesta){

		if(peticion.body.codigo && peticion.body.tipo){
			peticion.session.codigo = peticion.body.codigo;
			peticion.session.tipo = peticion.body.tipo;
            respuesta.cookie("codigo",peticion.body.codigo);
            respuesta.cookie("tipo_acceso",peticion.body.tipo);
			respuesta.send({status:1,mensaje:"Accedio correctamente"});
		}else{
			peticion.session.destroy();
			respuesta.send({status:0,mensaje:"401 Acceso no autorizado"});
		}
		
});

router.get("/logout", function(peticion, respuesta){
        respuesta.clearCookie("codigo");
		respuesta.clearCookie("tipo_acceso");
		peticion.session.destroy();
        respuesta.send({status:1,mensaje:"Ha terminado la sesion"});
        
});

router.get("/get-session", verificarAutenticacion, function(peticion, respuesta){
	respuesta.send(JSON.stringify(peticion.session));
});

/*  En proceso de utilizar rutas seguras
*/
router.get("/ruta-segura1",verificarAutenticacion,function(peticion, respuesta){
	respuesta.send("Ruta 1. No se deberia visualizar o acceder a esta ruta si no esta autenticado");
});

module.exports = router;