var map;

window.addMarkers = function addMarkers() {
  var element = document.querySelector("#locations-list");
  var locations = window.locations = JSON.parse(element.dataset.locations);

  map.removeMarkers();

  locations.forEach(function(location) {
    if (location.latitude && location.longitude) {
      var marker = map.addMarker({
        lat: location.latitude,
        lng: location.longitude,
        title: location.address,
        infoWindow: {
          content: '<p>' + location.street_address_one + '<br>' + location.city + ', ' + location.state + ' ' + location.zip + '</p><p>' + '<a href="tel:' + location.phone + '">' + location.phone +
          '</a></p> <p class="email"><a href="mailto:' + location.email_address + '">' + location.email_address + '</a></p> <p><a class="woof-link" href="https://www.google.com/maps/dir//' +
          location.street_address_one + '+' + location.city + '+' + location.state + '+' + location.zip + '" target="_blank">Get Directions</a></p>'
        }
      });
    }
  });

  // geoFindMe();
  setSafeBounds(element);
}

function setSafeBounds(element) {
  var l = element.dataset.l;
  if (l) {
    var latlngs   = l.split(',');
    var southWest = new google.maps.LatLng(latlngs[0], latlngs[1]);
    var northEast = new google.maps.LatLng(latlngs[2], latlngs[3]);
    var bounds    = new google.maps.LatLngBounds(southWest, northEast);
    map.fitBounds(bounds, 0);

  } else {
    map.fitZoom();
  }
}

// function geoFindMe() {
//   var output = document.getElementById("out");

//   if (!navigator.geolocation){
//     console.log("Geolocation is not supported by your browser");
//     return;
//   }

//   function success(position) {
//     var latitude  = position.coords.latitude;
//     var longitude = position.coords.longitude;

//     console.log('Latitude is ' + latitude + ', Longitude is ' + longitude);
//   }

//   function error() {
//     console.log("Unable to retrieve your location");
//   }

//   navigator.geolocation.getCurrentPosition(success, error);
// }

function geolocationSuccess(position) {
  var latitude = position.coords.latitude;
  var longitude = position.coords.longitude;
  // gon.global.ltln = 30.293,-87.543;
  var latlng = position.coords.latitude + "," + position.coords.longitude;

  console.log('Latitude is ' + latitude + ', Longitude is ' + longitude);


  // map.setCenter(latitude, longitude);
  // map.setZoom(6);

  // var bounds = map.getBounds();
  // var pos = bounds.getSouthWest().toUrlValue() + "," + bounds.getNorthEast().toUrlValue();
  // Turbolinks.visit('/locations?q=' + pos);

  Turbolinks.visit('/locations?q=' + latlng)
  // Turbolinks.visit('/locations?utf8=✓&near=' + latlng + '&commit=')

}
function geolocationError() {
  // Handle error, for now we'll just log to console
  console.log("please enable location for this feature to work!");
}
$(document).on('ready page:ready', function() {
  $("#current-location").on("click", function(event) {
    event.preventDefault();
    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(geolocationSuccess,
      geolocationError);
    } else {
      alert("Geolocation not supported!");
    }
  });
});





document.addEventListener("turbolinks:load", function() {
  map = window.map = new GMaps({
    div: '#map',
    lat: 35.941764,
    lng: -86.922942,
    zoom: 6
  });

  addMarkers();

  map.addListener("dragend", function() {
    var bounds = map.getBounds();
    var station = bounds.getSouthWest().toUrlValue() + "," + bounds.getNorthEast().toUrlValue();

    Turbolinks.visit('/locations?l=' + station);
  });

});
