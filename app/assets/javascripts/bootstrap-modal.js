$(document).ready(function(){
  $('#adoption-modal').modal('hide');
  $('#adopt-button').on('click', function(e){
    e.preventDefault();
    $('#adoption-modal').modal('show');
    
  });
  
});