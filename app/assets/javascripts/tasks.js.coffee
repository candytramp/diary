# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready=->
  $("#datetimepicker2").datetimepicker

    language: 'ru'
  #document.write document.getElementById('table1').rows[1].cells[3].innerText  
  
  $("#rows").css("background-color", "#75f1b8")
 
 

$(document).ready ready
$(document).on 'page:load', ready
