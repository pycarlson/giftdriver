$(document).ready(function(){
    var data = [{
      "content": "<div class='slide_inner'><a class='photo_link' href='#'><img class='photo' src='/assets/bear.jpg' ></a><a class='caption' href='#'>2</a></div>",
      "content_button": "<div class='thumb'><img src='/assets/bear.jpg' ></div><p></p>"
    }, {
      "content": "<div class='slide_inner'><a class='photo_link' href='#'><img class='photo' src='/assets/boy_on_porch.jpg' ></a><a class='caption' href='#'>3</a></div>",
      "content_button": "<div class='thumb'><img src='/assets/boy_on_porch.jpg' ></div><p></p>"
    }, {
      "content": "<div class='slide_inner'><a class='photo_link' href='#'><img class='photo' src='/assets/dino_wars.jpg'></a><a class='caption' href='#'>1</a></div>",
      "content_button": "<div class='thumb'><img src='/assets/dino_wars.jpg' ></div><p></p>"
    },{
      "content": "<div class='slide_inner'><a class='photo_link' href='#'><img class='photo' src='/assets/mom_daughter.jpg' ></a><a class='caption' href='#'>4</a></div>",
      "content_button": "<div class='thumb'><img src='/assets/mom_daughter.jpg' ></div><p></p>"
    }, {
      "content": "<div class='slide_inner'><a class='photo_link' href='#'><img class='photo' src='/assets/bikes.jpg' href='#'>5</a></div>",
      "content_button": "<div class='thumb'><img src='/assets/bikes.jpg' ></div><p></p>"
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