//------------------------Imports de modulos -----------------------------------
var express = require('express');
var path = require('path');
var app = express();
var login = require('./routes/login');

app.use('/', express.static(__dirname + "/public/"));
app.use('/login',login);
app.listen(3000);
