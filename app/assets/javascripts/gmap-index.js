geoFindMe();
var map;
var ulat;
var ulng;
var pos_cords;

window.addMarkers = function addMarkers() {
  var element = document.querySelector("#locations-list");
  var locations = window.locations = JSON.parse(element.dataset.locations);

  map.removeMarkers();

  locations.forEach(function(location) {
    if (location.street_address_two) {
      str_two = ', ' + location.street_address_two + ','
    } else {
      str_two = ''
    } 

    var name = location.store_name;
    display_title = name.includes("Grooming") ? name.replace("Woof Gang Bakery & Grooming", "") : name.replace("Woof Gang Bakery", "");

    if (location.latitude && location.longitude) {
      var marker = map.addMarker({
        lat: location.latitude,
        lng: location.longitude,
        title: location.address,
        infoWindow: {
          content: '<h4>' + display_title + '</h4>' +
          '<p>' + location.street_address_one + str_two  + ' ' + location.city + ', ' + location.og_state + ' ' + location.zip + '</p><p class="tel">' + '<a href="tel:' + location.phone + '">' + location.phone +
          '</a></p> <a class="woof-link" href="https://www.google.com/maps/dir//' + location.street_address_one + '+' + location.city + '+' + location.og_state + '+' + location.zip + '" target="_blank">Get Directions</a>' +
          '<a class="woof-link two" href="/locations/' + location.slug + '">Store Details</a>'
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
  
  var res_element = document.getElementById('result-info');
  if (res_element != null) {
    document.getElementById('result-info').innerHTML = gon.result_info;
  }
  // document.getElementById('result-info').innerHTML = gon.result_info;
}


function geoFindMe() {
  if (!navigator.geolocation){
    console.log("Geolocation is not supported by your browser");
    return;
  }


  function success(position) {
    var latitude  = position.coords.latitude;
    var longitude = position.coords.longitude;
    var latlng = position.coords.latitude + "," + position.coords.longitude;
    pos_cords = position.coords.latitude + "," + position.coords.longitude;
    ulat  = position.coords.latitude;
    ulng  = position.coords.longitude;

    console.log('Latitude is ' + latitude + ', Longitude is ' + longitude);
  }

  function error() {
    console.log("Unable to retrieve your location - ipinfo");

    $.getJSON('https://ipinfo.io/geo', function(response) {
      var loc = response.loc.split(',');
      var coords = {
          latitude: loc[0],
          longitude: loc[1]
      };
      var latlng = coords.latitude + "," + coords.longitude;

      pos_cords = coords.latitude + "," + coords.longitude;
      ulat  = coords.latitude;
      ulng  = coords.longitude;
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
    // zoomControl: false,
    // panControl: false,
    // streetViewControl: false
  });

  addMarkers();
  console.log("Official: " + gon.user_station);

  // map.addListener("dragend", function() {
  //   var bounds = map.getBounds();
  //   var station = bounds.getSouthWest().toUrlValue() + "," + bounds.getNorthEast().toUrlValue();

  //   Turbolinks.visit('/locations?l=' + station);
  // });
});
