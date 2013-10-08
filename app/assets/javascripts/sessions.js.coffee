# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

gm_init = ->
  if @map_canvas?
    gm_center = new google.maps.LatLng(-37.7833, 144.9667)
    gm_map_type = google.maps.MapTypeId.ROADMAP
    map_options = {center: gm_center, zoom: 11, mapTypeId: gm_map_type}
    map = new google.maps.Map(@map_canvas, map_options)
    load_session(map)

$ ->
  gm_init()
    
load_session = (map) ->
  callback = (data) -> display_on_map(data,map)
  $.get '/sessions.json', {}, callback, 'json'

display_on_map = (data,map) ->
  for index of data
    addMarker data[index], map

addMarker = (data, map) ->
  # Create the marker
  marker = new google.maps.Marker(
    position: new google.maps.LatLng(data.latitude, data.longitude)
    map: map
    title: data.name
  )
  
  # Create the infowindow with two DIV placeholders
  # One for a text string, the other for the StreetView panorama.
  content = document.createElement("DIV")
  title = document.createElement("DIV")
  title.innerHTML = "Date: " + data.date + '</br>' + "Client: " + data.client
  content.appendChild title

  link = document.createElement("DIV")
  link.className = "maplink"
  str = "Go to session"
  link.innerHTML = str.link("sessions/" + data.id)
  content.appendChild link

  streetview = document.createElement("DIV")
  streetview.style.width = "200px"
  streetview.style.height = "200px"
  #content.appendChild streetview
  infowindow = new google.maps.InfoWindow(content: content)
  
  # Open the infowindow on marker click
  google.maps.event.addListener marker, "click", ->
    infowindow.open map, marker

  
  # Handle the DOM ready event to create the StreetView panorama
  # as it can only be created once the DIV inside the infowindow is loaded in the DOM.
  google.maps.event.addListenerOnce infowindow, "domready", ->
    panorama = new google.maps.StreetViewPanorama(streetview,
      navigationControl: false
      enableCloseButton: false
      addressControl: false
      linksControl: false
      visible: true
      position: marker.getPosition()
    )
