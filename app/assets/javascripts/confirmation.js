$(document).ready(function(){
  $('div #adoption-confirmation').hide();
  $('#adopt-button').on('click', function(e){
    e.preventDefault();
    $('.family-details-card').hide();
    $('div #adoption-confirmation').show();
    console.log("made it here!");
  });
});