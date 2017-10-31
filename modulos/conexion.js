/*
 * El proposito de crear un modulo 'conexion' es para ahorrar codigo que se
 * utilizara en todo el proyecto.
 *
 * Una vez que se inicia el proyecto se hace una conexion a la base de datos
 * mediante el metodo 'connect', y segun lei en foros se recomienda mantener una
 * conexion establecida a lo largo del uso de la aplicacion en lugar de estar
 * connect, end, connect, end, connect.
 *
 * El ING dijo que estos metodos no se utilizaban pero stack overflow opina
 * diferente: https://stackoverflow.com/questions/14087924/cannot-enqueue-handshake-after-invoking-quit
 */

var mysql = require('mysql');

var conexion = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "carry"
});

conexion.connect(function(err) {
  if (err) throw err;
});

/*
 * Utilizamos exports para poder hacer uso de esta funcion en otros modulos.
 * Para mas informacion sobre exports: http://darrenderidder.github.io/talks/ModulePatterns/#/7
 * La funcion realizarQuery recibe como parametros una sentencia SQL y un arreglo de argumentos
 * Con esta funcion pueden hacerse INSERTS, SELECTS, DELETS, ETC. 
 */
exports.realizarQuery = function(sql, arreglo) {
  conexion.query(sql, arreglo, function(err, result) {
    if (err) throw err;
    console.log("Query finalizada con exito.");
  })
}




/*
* A esta funcion se le agrego un callback, para poder
* retornar el result (lo que se obtuvo de la consulta)
* con el fin de hacer el JSON stringify
* para enviar la informacion cuando hay un success
* al hacer la peticion AJAX
*/
exports.realizarQueryCB = function(sql, arreglo, cb) {
  conexion.query(sql, arreglo, function(err, result) {
    if (err) throw err;
    console.log("Query finalizada con exito.");
      cb(result);
  })
}
