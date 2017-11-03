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
  console.log("Conexion a carry_bd exitosa.");
});

exports.conexion;
/*
 * Utilizamos exports para poder hacer uso de esta funcion en otros modulos.
 * Para mas informacion sobre exports: http://darrenderidder.github.io/talks/ModulePatterns/#/7
 * La funcion realizarQuery recibe como parametros una sentencia SQL y un arreglo de argumentos
 * Con esta funcion pueden hacerse INSERTS, SELECTS, DELETS, ETC.
 */
exports.realizarQuery = function(sql, arreglo, callback) {
  conexion.query(sql, arreglo, (err, result) => {
    if (err) throw err;
    callback(result);
    //console.log(JSON.stringify(result)+'DESDE realizarQuery');
    //return result;
  });
}

//connection.query( 'SELECT * FROM some_table', ( err, rows ) => {
// do something with the results here
//} );



/*
 * A esta funcion se le agrego un callback, para poder
 * retornar el result (lo que se obtuvo de la consulta)
 * con el fin de hacer el JSON stringify
 * para enviar la informacion cuando hay un success
 * al hacer la peticion AJAX
 */


exports.realizarQrCB = function(sql, arreglo, sql2, arreglo2, callback) {

  //  connection.query( 'SELECT * FROM some_table', ( err, rows ) => {
  // do something with the results here
  //} );
  // the following code is executed *before* the query is executed

  conexion.query(sql, arreglo, (err, result) => {
    if (err) {
      throw err;
    } else {
      conexion.query('select codUsuario from tblusuarios order by codUsuario desc limit 1', (err, result) => {
        if (err) {
          throw err;
        } else {
          //console.log(result[0].codUsuario);
          arreglo2.push(result[0].codUsuario);
          conexion.query(sql2, arreglo2, (err, result) => {
            callback(result);
          });
        }
      })
    }
    //if (err) throw err;
    //console.log(JSON.stringify(result)+'DESDE realizarQuery');
    //return result;
  });

  //console.log(sql);
  //  var resultado;
  /*conexion.query(sql, arreglo, function(err, result){
    if(err){
      console.log('NO error');
      /*conexion.query("select codUsuario from tblusuarios order by codUsuario desc limit 1", (err, result)=>{
        if(err){
          console.log(result);
        }
        else {
          console.log('Error2');
        }
      })*/
  //}

  //else {
  //console.log(err);
  //}
  //f (err) {
  //console.log('Hubo un problema.');
  //}

  //else {
  //callback(sql2, arreglo2);
  //  }
  //callback(null, result);
  //console.log("Query finalizada con exito.");
  //  });
}
