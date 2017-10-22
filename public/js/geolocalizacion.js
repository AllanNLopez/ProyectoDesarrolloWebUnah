


var marker;
var map;
var infoWindow;
var geocoder;


function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 14.987239525774244, lng: -86.81396484375},
    zoom: 17


  });

  geocoder = new google.maps.Geocoder;
  infoWindow = new google.maps.InfoWindow({map: map});


  google.maps.event.addListener(map, 'click', function(event) {

    if (marker != null) clearMarker();
    //addMarker(event.latLng, map);
    geocodeLatLng(geocoder, map, infoWindow, event.latLng);



  });

  google.maps.event.addListener(map, 'mousemove', function(event) {
  map.setOptions({ draggableCursor: 'url(http://maps.google.com/mapfiles/openhand.cur), move' });



  });




  // Try HTML5 geolocation.
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };



      infoWindow.setPosition(pos);
      infoWindow.setContent('marca tu ubicacion mas exacta.');
      map.setCenter(pos);
    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });
  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }



  }

  function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ?
                        'Error: The Geolocation service failed.' :
                        'Error: Your browser doesn\'t support geolocation.');
  }

  /*

function addMarker(location, map) {
// Add the marker at the clicked location, and add the next-available label
// from the array of alphabetical characters.

marker = new google.maps.Marker({
  position: location,
  label: "A",
  map: map
});


var lat = location.lat();
var lng = location.lng();

//valores de las coordenadas lista ser enviadas al servidor

console.log(lat+" "+lng)


}
*/

function clearMarker() {
marker.setMap(null);
}

function geocodeLatLng(geocoder, map, infowindow, latlng) {

        geocoder.geocode({'location': latlng}, function(results, status) {
          if (status === 'OK') {
            if (results[1]) {
              map.setZoom(17);
              marker = new google.maps.Marker({
                position: latlng,
                map: map
              });
              infowindow.setContent(results[1].formatted_address);
              infowindow.open(map, marker);

              imprimirDatosObtenido(results ,latlng);//funcion para imprimir los datos obtenidos

            } else {
              window.alert('Resultados no encontrados');
            }
          } else {
            window.alert('Geocoder fallo debido a: ' + status);
          }
        });
      }





function imprimirDatosObtenido(results,latlng){
        var lat = latlng.lat();
        var lng = latlng.lng();
        console.log(lat+","+lng);
        console.log(results[1].address_components[0].long_name);
        console.log(results[1].address_components[1].long_name);
        console.log(results[1].address_components[2].long_name);
        console.log(results[1].address_components[3].long_name);

}

$('a[data-toggle="tab"').on('click', function() {
    setTimeout(function(){

        x = map.getZoom();
        c = map.getCenter();
        google.maps.event.trigger(map, 'resize');
        map.setZoom(x);
        map.setCenter(c);
        google.maps.event.trigger(map, 'resize');

    }, 5);
});


$("#myModal").on("shown.bs.modal", function () {
    setTimeout(function(){

        x = map.getZoom();
        c = map.getCenter();
        google.maps.event.trigger(map, 'resize');
        map.setZoom(17);
        map.setCenter(c);
        infoWindow.setPosition(c);
        infoWindow.setContent('marca tu ubicacion mas exacta.');



    },5);

});
