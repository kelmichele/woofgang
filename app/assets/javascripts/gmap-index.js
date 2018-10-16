document.addEventListener("turbolinks:load", function() {
  var map = new GMaps({
    div: '#map',
    lat: 38.9896,
    lng: 75.5050
  });
  window.map = map;

  var locations = JSON.parse(document.querySelector("#map").dataset.locations);
  window.locations = locations;

  locations.forEach(function(location) {
    if (location.latitude && location.longitude) {
      var marker = map.addMarker({
        lat: location.latitude,
        lng: location.longitude,
        title: location.address,
        infoWindow: {
          content: '<p>' + location.street_address_one + '<br>' + location.city + ', ' + location.state + ' ' + location.zip + '<br>' + '<a href="tel:' + location.phone + '">' + location.phone +
          '</a></p> <p><a href="https://www.google.com/maps/dir//' +
          location.street_address_one + '+' + location.city + '+' + location.state + '+' + location.zip + '" target="_blank">Get Directions</a></p>'
        }
      });
    }
  });

  var l = document.querySelector("#map").dataset.l;
  if (l) {
    var latlngs = l.split(',');
    var southWest = new google.maps.LatLng(latlngs[0], latlngs[1]);
    var northEast = new google.maps.LatLng(latlngs[2], latlngs[3]);
    var bounds = new google.maps.LatLngBounds(southWest, northEast);
    map.fitBounds(bounds, 0);
  } else {
    map.fitZoom();
  }

  document.querySelector("#redo-search").addEventListener("click", function(e) {
    e.preventDefault();

    var bounds = map.getBounds();
    var position = bounds.getSouthWest().toUrlValue() + "," + bounds.getNorthEast().toUrlValue();

    Turbolinks.visit('/locations?l=' + position);
  });

});
