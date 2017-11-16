var express = require('express');
var bodyParser = require("body-parser"); 
var multer = require("multer");

var storage = multer.diskStorage({
    destination: function(req, file, callback){
        callback(null, './public/img'); // set the destination
    },
    filename: function(req, file, callback){
        callback(null, Date.now() + '.jpg'); // set the file name and extension
    }
});
var upload = multer({storage: storage});
 
var realizarQuery = require('../modulos/conexion').realizarQuery;

var router = express.Router();
var urlEncodeParser = bodyParser.urlencoded({
  extended: false
});

router.use(bodyParser.json());

router.post('/add', upload.single('imagename'), function(req, res, next) {
  var image = req.file.filename;
  res.send(image);
});

router.post("/getTiendas", urlEncodeParser, function(request, response){
    var sql = "SELECT codEmpresa, nombreEmpresa from tblempresas where codUsuario = ?";
    var values = [request.body.codigoUsuario];
    realizarQuery(sql,values, function(res){
      response.send(res);
    });
});

router.post("/getStoreInfo", urlEncodeParser, function(request, response){
  var sql = "SELECT a.rtn, a.nombreEmpresa, a.ubicacion, a.actividad, a.sitioweb, a.telefono, a.informacion, a.codRubro, b.rubro "
            +"FROM tblempresas a INNER join tblrubro b on a.codRubro = b.codRubro "
            +"WHERE a.codEmpresa = ?";
  var values = [request.body.codEmpresa];
  realizarQuery(sql,values, function(res){
    response.send(res);
  });
});

router.post("/getDepartamentos", urlEncodeParser, function(request, response){
  var sql = "SELECT codDepartamento, departamento FROM tbldepartamentos where codRubro = ?";
  var values = [request.body.codigoRubro];
  realizarQuery(sql,values, function(res){
    response.send(res);
  });
});

router.post("/getCategorias", urlEncodeParser, function(request, response){
  var sql = "select codCategoria, categoria from tblcategorias where codDepartamento = ?";
  var values = [request.body.codigoDepartamento];
  realizarQuery(sql,values, function(res){
    response.send(res);
  });
});
 
router.post("/getDetalles", urlEncodeParser, function(request, response){
  var sql = "SELECT codDetalle, detalle from tbldetalles";
  var values = [];
  realizarQuery(sql,values, function(res){
    response.send(res);
  });
});


router.post("/guardarArticulo", urlEncodeParser, function(request, response){
  var sql = "INSERT INTO tblarticulos("
                            +"codArticulo, "
                            +"nombreArticulo, "
                            +"descripcion, "
                            +"precio, "
                            +"origenFabricacion, "
                            +"saldo, "
                            +"fechaPublicacion, "
                            +"estado, "
                            +"codCategoria, "
                           +" codUsuarioPublicador "
                          +") "
                +" VALUES (null,?,?,?,'Honduras',?,'NOW()',?,?,?)";
  var values = [ 
                request.body.nombreArticulo, 
                request.body.descripcion, 
                request.body.precio,  
                request.body.saldo,  
                request.body.estado, 
                request.body.codCategoria, 
                request.body.codUsuarioPublicador 
              ];
  realizarQuery(sql, values, function(res){
    response.send(res);
  })
});


module.exports = router;