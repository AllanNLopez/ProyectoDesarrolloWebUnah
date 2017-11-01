var express = require('express');
var path = require('path');
var app = express();

var registroUsuario = require('./routes/registro-usuario');
var registroAspirante = require('./routes/registro-aspirante');
var registroEmpresa = require('./routes/registro-empresa');
var usuario = require('./routes/usuario');

/*
 * En los imports esta var registroUsuario = require('./routes/registro-usuario')
 * Esto lo que nos permite es segmentar la funcionalidad dependiendo de las rutas
 * asi, no tendremos 188930 posts, otros 213782183 gets para cada pagina que
 * elaboremos en este archivo.
 */

app.use('/', express.static(__dirname + "/public/"));

/*
 * Lo que hace app.use('/login/registro-usuario', registroUsuario) es unir una
 * URL parcial : '/login/registro-usuario' con cualquier URL que se encuentre en
 * la variable registroUsuario que como definimos al inicio, hace referencia a
 * demas rutas en un archivo js.
 * EJEMPLO:
 * En registroUsuario tenemos:
 *   router.post("/holamundo", urlEncodeParser, function(request, response) {
 *   console.log('Hola Mundo!');
 *   }
 * Como vemos esta funcion post es llamada cuando la asignamos a la URL '/holamundo' pero,
 * como la utilizamos para unirla a '/login/registro-usuario', en realidad el
 * post lo recibe la URL '/login/registro-usuario/holamundo'
 */

app.use('/login/registro-usuario', registroUsuario);
app.use('/login/registro-aspirante', registroAspirante);
app.use('/login/registro-empresa', registroEmpresa);
app.use( "/user", usuario);


		//Tam
app.listen(3000, () => {
  console.log('Servidor iniciado en puerto 3000.');
});
