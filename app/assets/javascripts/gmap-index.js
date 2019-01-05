geoFindMe();
var map;
jQuery('#current-location').hide();

window.addMarkers = function addMarkers() {
  // var element = document.querySelector("#locations-list");
  // var locations = window.locations = JSON.parse(element.dataset.locations);

  var element = document.querySelector("#stores-list");
  var stores = window.stores = JSON.parse(element.dataset.stores);

  map.removeMarkers();

  // locations.forEach(function(location) {
  //   if (location.latitude && location.longitude) {
  //     var marker = map.addMarker({
  //       lat: location.latitude,
  //       lng: location.longitude,
  //       title: location.address,
  //       infoWindow: {
  //         content: '<p>' + location.street_address_one + '<br>' + location.city + ', ' + location.og_state + ' ' + location.zip + '</p><p>' + '<a href="tel:' + location.phone + '">' + location.phone +
  //         '</a></p> <p class="email"><a href="mailto:' + location.email_address + '">' + location.email_address + '</a></p> <p><a class="woof-link" href="https://www.google.com/maps/dir//' +
  //         location.street_address_one + '+' + location.city + '+' + location.state + '+' + location.zip + '" target="_blank">Get Directions</a></p>'
  //       }
  //     });
  //   }
  // });

  stores.forEach(function(store) {
    if (store.latitude && store.longitude) {
      var marker = map.addMarker({
        lat: store.latitude,
        lng: store.longitude,
        title: store.address,
        infoWindow: {
          content: '<p>' + store.street_address_one + '<br>' + store.city + ', ' + store.og_state + ' ' + store.zip + '</p><p>' + '<a href="tel:' + store.phone + '">' + store.phone +
          '</a></p> <p class="email"><a href="mailto:' + store.email_address + '">' + store.email_address + '</a></p> <p><a class="woof-link" href="https://www.google.com/maps/dir//' +
          store.street_address_one + '+' + store.city + '+' + store.state + '+' + store.zip + '" target="_blank">Get Directions</a></p>'
        }
      });
    }
  });

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
  document.getElementById('result-info').innerHTML = gon.result_info;
}


$(document).on('click', '#locateLink', function(e) {
  Turbolinks.visit('/stores')
});

function geoFindMe() {
  if (!navigator.geolocation){
    console.log("Geolocation is not supported by your browser");
    return;
  }


  function success(position) {
    var latitude  = position.coords.latitude;
    var longitude = position.coords.longitude;
    var latlng = position.coords.latitude + "," + position.coords.longitude;

    console.log('Latitude is ' + latitude + ', Longitude is ' + longitude);

    jQuery('#current-location').show();
    $(document).on('click', '#locateLink', function(e) {
      Turbolinks.visit('/stores?q=' + latlng)
    });

    $(document).on('click', '#current-location', function(event) {
      event.preventDefault();
      Turbolinks.visit('/stores?q=' + latlng)
    });
  }

  function error() {
    console.log("Unable to retrieve your location");

    $.getJSON('https://ipinfo.io/geo', function(response) {
      var loc = response.loc.split(',');
      var coords = {
          latitude: loc[0],
          longitude: loc[1]
      };
      var latlng = coords.latitude + "," + coords.longitude;

      jQuery('#current-location').show();
      $(document).on('click', '#locateLink', function(e) {
        Turbolinks.visit('/stores?q=' + latlng)
      });

      $(document).on('click', '#current-location', function(event) {
        event.preventDefault();
        Turbolinks.visit('/stores?q=' + latlng)
      });

    });
  }

  navigator.geolocation.getCurrentPosition(success, error);
}

document.addEventListener("turbolinks:load", function() {
  map = window.map = new GMaps({
    div: '#map',
    lat: 35.941764,
    lng: -86.922942,
    zoom: 8
    // styles: mapStyle
  });

  addMarkers();

  map.addListener("dragend", function() {
    var bounds = map.getBounds();
    var station = bounds.getSouthWest().toUrlValue() + "," + bounds.getNorthEast().toUrlValue();

    Turbolinks.visit('/stores?l=' + station);
    // Turbolinks.visit('/locations?l=' + station);
  });
});

