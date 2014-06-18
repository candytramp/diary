# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready=->
   $.mask.definitions["q"]="[0-9]"
   $("#phone").find("#contact_phone").mask "8 (qqq)qqq qq qq"
   return


$(document).ready ready
$(document).on 'page:load', ready
