$(document).ready(function(){
  $('[rel="tooltip"]').tooltip();
  
  $(".add-loc-form").on('ajax:success', function(e, data, status){
    if (data.location_code == null || data.location_id == null )
      {
      var alert = data.alert
      $(".container").prepend("<div class='alert'>"+alert+"</div>");
      }
  	else
  	  {
      var code = data.location_code
      var id = data.location_id
  	  $(".add-loc-form")[0].reset();
  	  $(".loc-list").append('<li>'+code+'</li>');
  	  $(".new_family select").append('<option value='+id+'>'+code+'</option>');
      }
  });
});