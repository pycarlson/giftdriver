$(document).ready(function(){
  $('div #adoption-confirmation').hide();
  $('#adopt-button').on('click', function(e){
    e.preventDefault();
    $('.add-family-button').hide();
    $('#adopt-button').hide();
    $('.family-details-card').hide();
    $('div #adoption-confirmation').show();
  });
  $('#no').on('click', function(e){
    e.preventDefault();
    $('div #adoption-confirmation').hide();
    $('.family-details-card').show();
    $('#adopt-button').show();
    $('.add-family-button').show();
  });
});