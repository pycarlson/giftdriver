$(document).ready(function(){
  $('.faq .answer').hide();
  $('.faq a').on('click', function(e){
    e.preventDefault();
    $(this).next('div.answer').slideToggle('fast');
  });
});