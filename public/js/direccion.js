function initMap() {
        var directionsDisplay = new google.maps.DirectionsRenderer;
        var directionsService = new google.maps.DirectionsService;
       

       var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 14,
          center: puntoOrigen
        });
        directionsDisplay.setMap(map);

        calculateAndDisplayRoute(directionsService, directionsDisplay);
        document.getElementById('mode').addEventListener('change', function() {
          calculateAndDisplayRoute(directionsService, directionsDisplay);
        });

        var service = new google.maps.DistanceMatrixService();
        service.getDistanceMatrix(
        {
          origins: [puntoA],
          destinations: [puntoB],
          travelMode: 'DRIVING', 
          unitSystem:  google.maps.UnitSystem.METRIC,
          avoidHighways: false,
          avoidTolls: false,
        }, callback);

      

      }

      function calculateAndDisplayRoute(directionsService, directionsDisplay) {
        var selectedMode = document.getElementById('mode').value;
        directionsService.route({
          origin: puntoA,  // Haight.
          destination: puntoB,  // Ocean Beach.
          // Note that Javascript allows us to access the constant
          // using square brackets and a string value as its
          // "property."
          travelMode: google.maps.TravelMode[selectedMode]
        }, function(response, status) {
          if (status == 'OK') {
            directionsDisplay.setDirections(response);
          } else {
            window.alert('Directions request failed due to ' + status);
          }
        });
      }




      
      function callback(response, status) {
        if (status !== 'OK') {
            alert('Error was: ' + status);
          } else {
            var results = response.rows[0].elements;
            console.log(results);
            document.getElementById("distancia").innerHTML=results[0].distance.text;
            document.getElementById("tiempo").innerHTML=results[0].duration.text;
          }
        
      }