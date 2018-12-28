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

document.addEventListener("turbolinks:load", function() {
    map = window.map = new GMaps({
      div: '#map',
      lat: 35.941764,
      lng: -86.922942,
      zoom: 7
    });


  addMarkers();

  // document.querySelector("#redo-search").addEventListener("click", function(e) {
  //   e.preventDefault();
  //   var bounds = map.getBounds();
  //   var station = bounds.getSouthWest().toUrlValue() + "," + bounds.getNorthEast().toUrlValue();
  //   Turbolinks.visit('/locations?l=' + station);
  // });

  map.addListener("dragend", function() {
    var bounds = map.getBounds();
    var station = bounds.getSouthWest().toUrlValue() + "," + bounds.getNorthEast().toUrlValue();

    Turbolinks.visit('/locations?l=' + station);
  });

});
