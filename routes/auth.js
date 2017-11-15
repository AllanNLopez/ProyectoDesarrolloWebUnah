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

<<<<<<< HEAD
router.use(bodyParser.json());
router.use(cookieParser());
router.use(session({secret:'sesioncarry',resave:true,saveUninitialized:true}));
=======


//router.use(bodyParser.json());
//var publicAdmin = express.static("public-admin");

router.get("/",function(request,response){


});

router.post("/signin", urlEncodeParser, function(request, response) {
    var hash = sha512(request.body.contrasena);
    var pass = hash.toString('hex');
    var sql = "SELECT codUsuario, nombres, apellidos, telefono, correo, contrasena, codTipoUsuario FROM tblUsuarios WHERE correo=? and contrasena=?";
    var values = [request.body.correo, request.body.contrasena];
    console.log(request.body.contrasena);
    
    realizarQuery(sql,values, function(res){
        response.send(res);
    });
    
});
>>>>>>> dc62e97fb81e734477824fedc4168a3fdfe3349a

function verificarAutenticacion(peticion, respuesta, next){
	if(peticion.session.usuario)
		return next();
	else
		respuesta.send("ERROR, ACCESO NO AUTORIZADO");
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
    var sql = "SELECT codUsuario as codigo, nombres, apellidos, telefono, correo, contrasena, codTipoUsuario as tipo FROM tblUsuarios WHERE correo=? and contrasena=?";
    var values = [request.body.correo, pass];
    var valores;
    realizarQuery(sql,values, function(res){
        response.send(JSON.stringify(res));
    });
});

router.post("/login", urlEncodeParser, function(peticion, respuesta){
		if(peticion.body.codigo !== '' && peticion.body.tipo !==''){
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
		respuesta.sendFile(__dirname+"../public/index.html");
});

router.get("/get-session",function(peticion, respuesta){
	respuesta.send(JSON.stringify(peticion.session));
});

module.exports = router;