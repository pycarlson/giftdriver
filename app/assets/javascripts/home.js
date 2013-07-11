$(document).ready(function(){
    var data = [{
      "content": "<div class='slide_inner'><a class='photo_link' href='#'><img class='photo' src='/assets/presents_openings1500.jpg'></a><a class='caption' href='#'>1</a></div>",
      "content_button": "<div class='thumb'><img src='/assets/presents_openings1500.jpg' ></div><p></p>"
    }, {
      "content": "<div class='slide_inner'><a class='photo_link' href='#'><img class='photo' src='/assets/toy-drive-header.jpg' ></a><a class='caption' href='#'>2</a></div>",
      "content_button": "<div class='thumb'><img src='/assets/toy-drive-header.jpg' ></div><p></p>"
    }, {
      "content": "<div class='slide_inner'><a class='photo_link' href='#'><img class='photo' src='/assets/Gift766_3817.jpg' ></a><a class='caption' href='#'>3</a></div>",
      "content_button": "<div class='thumb'><img src='/assets/Gift766_3817.jpg' ></div><p></p>"
    }, {
      "content": "<div class='slide_inner'><a class='photo_link' href='#'><img class='photo' src='/assets/gifts.jpg' ></a><a class='caption' href='#'>4</a></div>",
      "content_button": "<div class='thumb'><img src='/assets/gifts.jpg' ></div><p></p>"
    }, {
      "content": "<div class='slide_inner'><a class='photo_link' href='#'><img class='photo' src='/assets/HilfigerHolidayParty.jpg' href='#'>5</a></div>",
      "content_button": "<div class='thumb'><img src='/assets/HilfigerHolidayParty.jpg' ></div><p></p>"
    }]

    $("#flavor_2").agile_carousel({ 
      carousel_data: data,
      carousel_outer_height: 560,
      carousel_height: 230,
      slide_height: 230,
      carousel_outer_width: 1280,
      slide_width: 1280,
      transition_time: 540,
      timer:4000,
      continuous_scrolling: true,
      control_set_2: "content_buttons",
      change_on_hover: "content_buttons"
    });
  });