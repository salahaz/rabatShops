# Determines User's current coordinates and returns the values to hidden fields in the views

$(document).ready =>
    getLocation = ->
        if navigator.geolocation
          navigator.geolocation.getCurrentPosition (position) ->
            coord = position.coords
            timestamp = position.timestamp
            data =
              lat: coord.latitude,
              lng: coord.longitude,
            $("#longitude").val(position.coords.longitude)
            $("#latitude").val(position.coords.latitude)
        return

    $(document).on "turbolinks:load", ->
      getLocation()
    
  

