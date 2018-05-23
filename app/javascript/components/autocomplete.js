function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var grandmomAddress = document.getElementById('grandmom_address');

    if (grandmomAddress) {
      var autocomplete = new google.maps.places.Autocomplete(grandmomAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(grandmomAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
