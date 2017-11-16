function cargarSuscripcion() {
    var codigo = getCookie("codigo");
    var tipo = getCookie("tipo_acceso");
    //console.log(codigo);
    var parametros = "codigoUser=" + codigo;
    //console.log(parametros);
    var empresa = null;
    if (tipo == 3) {
        var promise = $.ajax({
            url: "userSuscripcion/getEmpresa",
            method: "POST",
            data: parametros,
            dataType: "json",
            success: function (respuesta) {
                console.log(respuesta);
                if (respuesta.length == 1) {
                    empresa = "codigo=" + respuesta[0].codEmpresa;
                }
            },
            error: function (e) {
                alert("Ocurrio un error.");
                console.log(JSON.stringify(e));
            }
        });
        promise.then(function () {
            $.ajax({
                url: "userSuscripcion/getSuscripcion",
                method: "POST",
                data: empresa,
                dataType: "json",
                success: function (respuesta) {

                    console.log(respuesta);
                    if (respuesta.length > 0) {
                        for (let i = 0; i < respuesta.length; i++) {
                            $('#tab-miSuscripcion').append('<div class="row">' +
                                '<div class="table-responsive col-md-12 col-sm-12 col-lg-12">' +
                                '<table class="table display">' +
                                '<thead>' +
                                '<th>#</th>' +
                                '<th>Fecha Aprobacion</th>' +
                                '<th>Fecha vencimiento</th>' +
                                '<th class="hidden-xs">Estado del plan</th>' +
                                '</thead>' +
                                '<tbody>' +
                                '<tr>' +
                                '<td>#</td>' +
                                '<td>' + respuesta[i].fechaAprobación + '</td>' +
                                '<td class="hidden-xs">' + respuesta[i].fechaVencimiento + '</td>' +
                                '<td>' + respuesta[i].estadoPlan + '</td>' +
                                '</tr>' +
                                '</tbody>' +
                                '</table>' +
                                '</div>' +
                                '</div>');
                        }
                    } else
                        $('#tab-miSuscripcion').append('<h2>No tiene suscripciones activas</h2>');
                },
                error: function (e) {
                    alert("Ocurrio un error.");
                    console.log(JSON.stringify(e));
                }
            });
        });
    } else {
        $('#tab-miSuscripcion').append('<h2>Usted no es un usuario registrado con una empresa y suscripcion</h2>');
    }
}

function cargarHistorial() {
    var codigo = getCookie("codigo");
    var tipo = getCookie("tipo_acceso");
    //console.log(codigo);
    var parametros = "codigoUser=" + codigo;
    //console.log(parametros);
    var empresa = null;
    if (tipo == 3) {
        var promise = $.ajax({
            url: "userSuscripcion/getEmpresa",
            method: "POST",
            data: parametros,
            dataType: "json",
            success: function (respuesta) {
                console.log(respuesta);
                if (respuesta.length == 1) {
                    empresa = "codigo=" + respuesta[0].codEmpresa;
                }
            },
            error: function (e) {
                alert("Ocurrio un error.");
                console.log(JSON.stringify(e));
            }
        });
        promise.then(function () {
            $.ajax({
                url: "userSuscripcion/getHistorial",
                method: "POST",
                data: empresa,
                dataType: "json",
                success: function (respuesta) {
                    if (respuesta.length > 0) {
                        for (let i = 0; i < respuesta.length; i++) {
                            $('#tab-miHistorial').append('<div class="row">' +
                                '<div class="table-responsive col-md-12 col-sm-12 col-lg-12">' +
                                '<table class="table display">' +
                                '<thead>' +
                                '<th>#</th>' +
                                '<th>Fecha Aprobacion</th>' +
                                '<th>Fecha vencimiento</th>' +
                                '<th class="hidden-xs">Estado del plan</th>' +
                                '</thead>' +
                                '<tbody>' +
                                '<tr>' +
                                '<td>#</td>' +
                                '<td>' + respuesta[i].fechaAprobación + '</td>' +
                                '<td class="hidden-xs">' + respuesta[i].fechaVencimiento + '</td>' +
                                '<td>' + respuesta[i].estadoPlan + '</td>' +
                                '</tr>' +
                                '</tbody>' +
                                '</table>' +
                                '</div>' +
                                '</div>');
                        }
                    } else
                        $('#tab-miHistorial').append('<h2>No tiene suscripciones activas</h2>');
                },
                error: function (e) {
                    alert("Ocurrio un error.");
                    console.log(JSON.stringify(e));
                }
            });
        });
    } else {
        $('#tab-miHistorial').append('<h2>Usted no es un usuario registrado con una empresa y suscripcion</h2>');
    }
}


//Funcion para obtener datos de una cookie
//Las cookies definidas en routes/auth.js son
//codigo: codigo del usuario
//tipo_acceso: codigo de acceso para 3 tipos de usuario
//Para obtener codigo de usuario
//var user = getCookie("codigo");
//Para obtener el tipo de acceso
//var access = getCookie("tipo_acceso");
function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

$(document).ready(function () {
    cargarSuscripcion();
    cargarHistorial();
});
