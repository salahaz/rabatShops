$(document).ready =>
    console.log("Hello World 1")
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
        console.log("Hello World 3");
        return

    $(document).on "turbolinks:load", ->
      console.log("Hello World 2")
      getLocation()
      console.log("Hello World 5");
    
  

