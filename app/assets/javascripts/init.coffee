#For explanation, see: http://brandonhilkert.com/blog/organizing-javascript-in-rails-application-with-turbolinks/
window.App ||= {}
App.init = ->
  #app initialization stuff
  window.log = window.console.log.bind window.console
#As many have found out the hard way, when Turbolinks is enabled in a project, jQuery $(document).ready functions don’t get fired from page to page. In order to call the init() function on each page transition, we’ll hook in to the  turbolinks:load event
$(document).on "turbolinks:load", ->
  App.init()
