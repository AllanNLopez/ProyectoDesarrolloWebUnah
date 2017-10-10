


var marker;
var map;
var infoWindow
function initMap() {
map = new google.maps.Map(document.getElementById('map'), {
  center: {lat: 14.987239525774244, lng: -86.81396484375},
  zoom: 17
});

google.maps.event.addListener(map, 'click', function(event) {
  
  if (marker != null) clearMarker();
  addMarker(event.latLng, map);
});

google.maps.event.addListener(map, 'mousemove', function(event) {
map.setOptions({ draggableCursor:'crosshair',});
});


infoWindow = new google.maps.InfoWindow({map: map});

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
                      'Error: El servicio de geolocalizacion ha fallado.' :
                      'Error: Su navegador no soporta el servicio de Geolocation.');
}

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

function clearMarker() {
marker.setMap(null);
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
        map.setZoom(15);
        map.setCenter(c);
        infoWindow.setPosition(c);
        infoWindow.setContent('marca tu ubicacion mas exacta.');



    },5);

});

      





     
      

