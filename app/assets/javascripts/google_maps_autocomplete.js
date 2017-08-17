$(document).ready(function() {
  var product_address = $('#city').get(0);

  if (product_address) {
    var autocomplete = new google.maps.places.Autocomplete(product_address, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(product_address, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }

  $('#form-index').submit(function(){
    if ($('#city').val() == ''){
      $('#lat').val('');
      $('#lng').val('');
    }
  });
});

function onPlaceChanged() {
  var place = this.getPlace();
  var components = getAddressComponents(place);
  $('#city').trigger('blur').val(components.city);
  $('#lat').val(place.geometry.location.lat());
  $('#lng').val(place.geometry.location.lng());
  console.log(place.geometry.location.lat())

}

function getAddressComponents(place) {
  // If you want lat/lng, you can look at:
  // - place.geometry.location.lat()
  // - place.geometry.location.lng()

  var city = null;
  var country_code = null;
  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {
      var type = component.types[j];
      if (type == 'street_number') {
        street_number = component.long_name;
      } else if (type == 'route') {
        route = component.long_name;
      } else if (type == 'postal_code') {
        zip_code = component.long_name;
      } else if (type == 'locality') {
        city = component.long_name;
      } else if (type == 'country') {
        country_code = component.short_name;
      }
    }
  }

  return {
    city: city
  };

}

