/*
$(document).ready(function(){
  $('[data-toggle="popover"]').popover();




});
*/

/*   funciones para ocultar y aparecer el sidebar  */
if (screen.width < 480) {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft = "0";
} else {
  $('#close-link').addClass('hidden');
  $('#btnOpciones').addClass('hidden');
}

function openNav() {
  if (screen.width < 480) {
    document.getElementById("mySidenav").style.width = "100%";
    document.getElementById("mySidenav").style.height = "100%";
    document.getElementById("mySidenav").style.position = "fixed";
    //document.getElementById("main").style.marginLeft = "250px";
    //document.getElementById("main").style.display = "none";
  } else {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
    document.getElementById("mySidenav").style.height = "auto";
  }
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft = "0";
  //document.getElementById("main").style.display = "block";
  $("#mySidenav").removeClass("sidenav-small");
}

/*
 * La funcion validarCampo sirve para comparar el valor de un input con el de una
 * expresion regular. Los campos validados son los que pertenecen a las formas
 * por ejemplo, nombre, apellido, correo etc.
 */

function validarCampo(valor, tipoCampo, id) {
  var input = valor;
  var id = '#' + id;
  var is_correct;

  switch (tipoCampo) {
    case 'nombre':
      is_correct = /^[A-Za-z\'\s\.\,]+$/.test(input);
      break;
    case 'apellido':
      is_correct = /^[A-Za-z\'\s\.\,]+$/.test(input);
      break;
    case 'id':
      is_correct = /\d{4}-\d{4}-\d{5}/.test(input);
      break;
    case 'phone':
      is_correct = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/.test(input);
      break;
    case 'email':
      is_correct = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(input);
      break;
    case 'domicilio':
      if (input !== '') {
        is_correct = true;
      } else {
        is_correct = false;
      }
      break;
    case 'password':
      var passwordConfirm = id + 'Confirm';
      /*
       * Esta expresion regular admite contraseñas con los siguientes parametros:
       * At least one upper case English letter, (?=.*?[A-Z])
       * At least one lower case English letter, (?=.*?[a-z])
       * At least one digit, (?=.*?[0-9])
       * At least one special character, (?=.*?[#?!@$%^&*-])
       * Minimum eight in length .{8,} (with the anchors)
       */
      is_correct = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/.test(input);
      if (input == $(passwordConfirm).val() && is_correct) {
        $(passwordConfirm).removeClass("invalid").addClass("valid");
      } else {
        $(passwordConfirm).removeClass("valid").addClass("invalid");
        is_correct = false;
      }
      break;
    case 'rtn':
      is_correct = /[0-9]{14}/.test(input);
      break;
    case 'website':
      is_correct = /^(http\:\/\/|https\:\/\/)?([a-z0-9][a-z0-9\-]*\.)+[a-z0-9][a-z0-9\-]*$/.test(input);
      break;
    default:
      break;
  }

  if (is_correct) {
    $(id).removeClass("invalid").addClass("valid");
  } else {
    $(id).removeClass("valid").addClass("invalid");
  }
  // modificando funcion para retonar el valor y aplicarlo para futuras soluciones
  return is_correct;
}

/*
 * La funcion validarSelect se utiliza en los campos que tienen una opcion
 * default al momento de cargar el formularo, por ejemplo, Dia, Mes, Año, etc.
 */
function validarSelect(id) {
  var id = '#' + id;
  var input = $(id).val();
  if (input == 'Día' || input == 'Mes' || input == 'Año' || input == 'Seleccione oferta laboral' || input == 'Seleccione un rubro o actividad') {
    $(id).removeClass("valid").addClass("invalid");
  } else {
    $(id).removeClass("invalid").addClass("valid");
  }
}
/*-----------------------Funcion para SUMBIT las forms------------------------*/
function submitForm(formulario, tipoFormulario) {
  var id = '#' + formulario;
  var form_data = $(id).serializeArray();
  var suma = 0;

  for (var input in form_data) {
    var element = $("#" + form_data[input]['name']);
    var valid = element.hasClass("valid");
    if (!valid) {
      suma++;
    }
  }

  if (id == '#formularioEmpresa2') {
    suma = suma + validarForm('formularioEmpresa');
  }

  if (suma === 0) {
    $('#mensajeError').hide();
  } else {
    $('#mensajeError').show();
  }

  var valid = $('#checkTermino').is(':checked');
  if (!valid) {
    $('#mensajeErrorTerminos').show();
  } else {
    $('#mensajeErrorTerminos').hide();
  }

  if (!$("#mensajeError").is(":visible") && !$("#mensajeErrorTerminos").is(":visible")) {
    /*
     * Se podria agregar establecer el siguiente bloque de codigo en una funcion
     * aparte que reciba por parametro un tipoFormulario y dependiendo de este
     * se establezca la ruta a usarse
     */
    if (tipoFormulario = 'registroUsuario') {
      var data = $(id).serializeObject();
      $.ajax({
        type: "POST",
        url: "registro-usuario/",
        crossDomain: true,
        contentType: 'application/json',
        data: JSON.stringify(data)
      }).done(function(data) {})

      $(id).trigger("reset");
      $(':input').removeClass('valid');
      alert("Usuario registrado exitosamente.");
    }
    /* NO BORRAR ESTE BLOQUE
      if(tipoFormulario='Empresa'){
        console.log((JSON.stringify($('#formularioEmpresa').serializeObject())));
      }
      console.log((JSON.stringify($(id).serializeObject())));
    }
    */
  }
}

/*
 * La funcion validarForm fue creada para validar un formulario adicional, como es
 * el caso de 'formulario-empresa' que contiene dos formularios.
 */
function validarForm(formulario) {
  var id = '#' + formulario;
  var form_data = $(id).serializeArray();
  var suma = 0;

  for (var input in form_data) {
    var element = $("#" + form_data[input]['name']);
    var valid = element.hasClass("valid");
    if (!valid) {
      suma++;
    }
  }

  return suma;
}

/*
 * La siguiente funcion convierte un objeto a formato JSON. Normalmente es llamada
 * luego de llamar a la funcion 'serializeArray'. La funcion serializeArray recibe
 * un formulario y retorna un arreglo que NO ES formato JSON.
 */
$.fn.serializeObject = function() {
  var o = {};
  var a = this.serializeArray();
  $.each(a, function() {
    if (o[this.name] !== undefined) {
      if (!o[this.name].push) {
        o[this.name] = [o[this.name]];
      }
      o[this.name].push(this.value || '');
    } else {
      o[this.name] = this.value || '';
    }
  });
  return o;
};

//eventos click

$('#btn-reg-user').click(function() {
  //Aqui por ejemplo capturar los valores de las cajas de texto del formulario y
  //luego imprimer esos valores como prueba de que se capturaron, luego se enviaran como parametros
  // para un query
  alert("Se debera guardar");

});
