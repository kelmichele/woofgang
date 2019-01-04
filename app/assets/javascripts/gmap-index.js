geoFindMe();
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
          content: '<p>' + location.street_address_one + '<br>' + location.city + ', ' + location.og_state + ' ' + location.zip + '</p><p>' + '<a href="tel:' + location.phone + '">' + location.phone +
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


$(document).on('click', '#locateLink', function(e) {
  Turbolinks.visit('/locations')
});

function geoFindMe() {
  if (!navigator.geolocation){
    console.log("Geolocation is not supported by your browser");
    return;
  }

  function success(position) {
    jQuery('#current-location').hide();

    var latitude  = position.coords.latitude;
    var longitude = position.coords.longitude;
    var latlng = position.coords.latitude + "," + position.coords.longitude;

    // alert('Latitude is ' + latitude + ', Longitude is ' + longitude);
    console.log('Latitude is ' + latitude + ', Longitude is ' + longitude);

    jQuery('#current-location').show();
    $(document).on('click', '#locateLink', function(e) {
      Turbolinks.visit('/locations?q=' + latlng)
    });

    $(document).on('click', '#current-location', function(event) {
      event.preventDefault();
      Turbolinks.visit('/locations?q=' + latlng)
    });
  }

  function error() {
    console.log("Unable to retrieve your location");
  }

  navigator.geolocation.getCurrentPosition(success, error);
}


// function geolocationSuccess(position) {
//   var latitude = position.coords.latitude;
//   var longitude = position.coords.longitude;
//   var latlng = position.coords.latitude + "," + position.coords.longitude;
// }
// $(document).on('ready page:ready', function() {
//   $("#current-location").on("click", function(event) {
//     event.preventDefault();
//     if ("geolocation" in navigator) {
//       navigator.geolocation.getCurrentPosition(geolocationSuccess,
//       geolocationError);
//     } else {
//       alert("Geolocation not supported!");
//     }
//   });
// });





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
