// $(document).ready(function(){

//   $('div #donation-request').hide();

//   $('#confirm-button').on('click', function(e){
//     e.preventDefault();

//     var $url = $('div #donation-request').data('url');
//     var $id = $('div #donation-request').data('id');

//     if ( $url === false ) {

//       $.ajax({
//         type: "post",
//         url: "/families/" + $id + "/adopt"
//       });

//       } else {
      
//       $('.add-family-button').hide();
//       $('#adoption-confirmation').hide();
//       $('#adopt-button').hide();
//       $('.family-details-card').hide();
//       $('.page-title h4').hide();
//       $('div #donation-request').show();

//       $.ajax({
//         type: "post",
//         url: "/families/" + $id + "/adopt"
//       });
       
//     }
//   });
// });