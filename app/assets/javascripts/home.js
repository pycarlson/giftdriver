function changeColors(colors){
  for (var k=1; k<13; k++)
  {
    $("#big-daddy div:nth-child("+k+")").css("background-color", colors[Math.floor(Math.random()*3)]);
  }
}

$(document).ready(function(){
  var colors = ["#30387F","#952849","#599528" ]
  changeColors(colors);

});
