$(document).on 'click', "a.add_fields",->
  new_id=new Date().getTime()
  regexp = new RegExp("new_#{$(this).data("association")}","g")
  $(this).closest("fieldset").find(".fields").append($(this).data("body").replace(regexp,new_id))
  false
$(document).on 'click',"a.remove_fields", ->
  if confirm("Вы уверены?")
    row=$(this).closest(".row")
    row.find("[data-destroy]").val('1')
    row.hide()
  false

