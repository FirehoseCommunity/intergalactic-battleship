$(function () {

   
  $('.square').droppable({
    tolerance: 'pointer',
    snap: '.square',
    drop: function(event, ui) {
      var piece = $(".lastClicked");
      var ship = piece.data("shipId");
      var x = $(event.target).data("xcoord");
      var y = $(event.target).data("ycoord");
      var length = piece.data("length");
      var endPt = x + length - 1;
      var name = piece.data("name");
      var shipAttributes = {
        x: x, 
        y: y, 
        ship_id: ship,
        length: length,
        endpt: endPt,
        name: name
      };

      console.log(shipAttributes);
      var drop_p = $(this).offset();
      var drag_p = ui.draggable.offset();
      var left_end = drop_p.left - drag_p.left + 1;
      var top_end = drop_p.top - drag_p.top + 1;
      if(endPt > 10) {
         ui.draggable.draggable({revert: "invalid"});
         
      } else {
        ui.draggable.animate({
          top: '+=' + top_end,
          left: '+=' + left_end,
        });
      }
    }
  });

  $('.draggable').draggable({
    containment: "#wrapper",
    revert: 'invalid',
    scroll: false,
    stack: ".square",
    opacity: 0.8, 
    cursor: "move",
    handle: ".drag",

  });

  $( ".rotate" ).click(function() {
    var ship = $(".lastClicked");
    var coord = ship.data('x');
    console.log(coord);
    if(coord == 1) {
      console.log('cannot rotate')
        $(this).css("transform","" );
    }

    if ($(this).css( "transform" ) == 'none') { 
        $(this).css("transform","rotate(90deg)").addClass("vert");
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
    