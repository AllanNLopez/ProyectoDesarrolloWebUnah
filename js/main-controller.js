
/*
$(document).ready(function(){
  $('[data-toggle="popover"]').popover();

	$('#carrito').DataTable({
		"dom": '<"toolbar">frtip'
	});



});
*/

/*   funciones para ocultar y aparecer el sidebar  */
if (screen.width <480) {
    	document.getElementById("mySidenav").style.width = "0";
    	document.getElementById("main").style.marginLeft= "0";
}else
{
	$('#close-link').addClass('hidden');
	$('#btnOpciones').addClass('hidden');
}

function openNav() {
	if (screen.width <480) {
		document.getElementById("mySidenav").style.width = "100%";
		document.getElementById("mySidenav").style.height = "100%";
		document.getElementById("mySidenav").style.position = "fixed";
		//document.getElementById("main").style.marginLeft = "250px";
		//document.getElementById("main").style.display = "none";
	}else
	{
		document.getElementById("mySidenav").style.width = "250px";
		document.getElementById("main").style.marginLeft = "250px";
		document.getElementById("mySidenav").style.height = "auto";
	}
}

function closeNav() {
	document.getElementById("mySidenav").style.width = "0";
	document.getElementById("main").style.marginLeft= "0";
	//document.getElementById("main").style.display = "block";
	$("#mySidenav").removeClass("sidenav-small");
}

/*----------------------------Funciones de validacion-------------------------*/
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
      if (input != '') {
        is_correct = true;
      } else {
        is_correct = false;
      }
			break;
		case 'password':
			var passwordConfirm = id+'Confirm';
      /*
      This regex will enforce these rules:
      At least one upper case English letter, (?=.*?[A-Z])
      At least one lower case English letter, (?=.*?[a-z])
      At least one digit, (?=.*?[0-9])
      At least one special character, (?=.*?[#?!@$%^&*-])
      Minimum eight in length .{8,} (with the anchors)
      */
      is_correct = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/.test(input);
			if(input == $(passwordConfirm).val() && is_correct){
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
}

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
function submitForm(formulario) {
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

	if(id == '#formularioEmpresa2'){
			suma = suma + validarForm('formularioEmpresa');
	}

  if (suma == 0) {
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
    console.log('Hace algo con el submit');
  }
}

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
