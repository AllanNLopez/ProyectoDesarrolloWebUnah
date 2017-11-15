var express = require('express');
var bodyParser = require("body-parser"); 
var realizarQuery = require('../modulos/conexion').realizarQuery;

var router = express.Router();
var urlEncodeParser = bodyParser.urlencoded({
  extended: false
});

router.use(bodyParser.json());

router.get("/getTiendas", function(request, response){
    response.send("hola");
});

module.exports = router;