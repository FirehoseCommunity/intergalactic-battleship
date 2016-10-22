$(function () {


  $('.square').droppable({
  tolerance: 'intersect',
  snap: '.square',
  drop: function(event, ui) {
    var piece = $(".lastClicked");
    var ship = piece.data("shipId");
    var x = $(event.target).data("xcoord");
    var y = $(event.target).data("ycoord");
    var shipAttributes = {
      x: x, 
      y: y, 
      ship_id: ship
    };
    console.log(shipAttributes);
    var drop_p = $(this).offset();
    var drag_p = ui.draggable.offset();
    var left_end = drop_p.left - drag_p.left + 1;
    var top_end = drop_p.top - drag_p.top + 1;
    ui.draggable.animate({
      top: '+=' + top_end,
      left: '+=' + left_end
    });
  }
});

  $('.draggable').draggable({
    revert: 'invalid',
    scroll: false,
    stack: ".square"
  });

  $( ".rotate" ).click(function() {
    console.log($('#coords').text());
    if ($('#coords').text() == 1) {
        $(this).css("transform","" );
    }    
    if ($(this).css( "transform" ) == 'none') { 
        $(this).css("transform","rotate(90deg)");
    } else {
        $(this).css("transform","" );
    }
});

$('.piece').mousedown(function(){
  console.log(this);
  $('.lastClicked').removeClass('lastClicked');
  $(this).addClass('lastClicked');
});

});