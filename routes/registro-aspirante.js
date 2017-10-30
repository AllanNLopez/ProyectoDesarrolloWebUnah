/*
 * En este archivo utilizamos sha512 que nos servira para encriptar las
 * contraseñas antes de almacenarlas.
 */
var express = require('express');
var bodyParser = require("body-parser");
/*
 * Importamos la funcion realizarQuery para facilitar la insercion de informacion
 * en la base de datos
 */
var realizarQueryCB = require('../modulos/conexion').realizarQueryCB;
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

  var tipoAspirante = request.body.selectOfertaLaboral;
  var codTipoAspirante;
  if(tipoAspirante == 'Agente carry permanente'){codTipoAspirante=1;}
  if(tipoAspirante == 'Agente carry recurrente'){codTipoAspirante=2;}
  var sql = "INSERT INTO tblaspirantes(codAspirante, nombre, apellido, identificacion, nacimiento, telefono, correo, domicilio, codTipoAspirante_fk) VALUES (?,?,?,?,STR_TO_DATE(?, '%m-%d-%Y'),?,?,?,?)";
  var values = [
    0,
    request.body.txtNames,
    request.body.txtLastname,
    request.body.txtId,
    request.body.fechaPicker,
    request.body.txtPhone,
    request.body.txtEmail,
    request.body.txtDomicilio,
    contrasena,
    codTipoAspirante
  ];
  //Utilizamos la funcion realizarQueryCB que importamos, recibe como parametros
  //una sentencia sql, un arreglo con los parametros ? de la sentencia misma y una funcion callback
  //ya que NodeJS trabaja con I/O asincronas, todo esto con el fin de retornar el resultado de la consulta.
  //  :v Deberia funcionar v:
   var respuesta = function(callback){
      realizarQuery(sql, values, function(data){
          callback(data);
      });
    };

  response.send(JSON.stringify(respuesta));
    
});

module.exports = router;

/*
*
*var getOffers = function (email, callback) {
*    var branchObj = require('./file2.js');
*    branchObj.getUserBranch(email, function(data){
*        This data stack 2  
*        callback(data);
*    });
*           };
*
*       var respuesta = function(callback){
*      realizarQuery(sql, values, function(data){
*          callback(data);
*      });
*    }
*  response.send(JSON.stringify(respuesta));
*/
