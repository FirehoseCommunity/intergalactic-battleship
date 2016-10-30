$(function () {
   
  $('.square').droppable({
    tolerance: 'pointer',
    snap: '.square',
    drop: handleDrop
  });

  function handleDrop(event, ui) {
    var piece = $(".lastClicked");
    var ship = piece.data("shipId");
    var x = $(event.target).data("xcoord");
    var y = $(event.target).data("ycoord");
    var length = piece.data("length");
    var endPt = x + length - 1;
    var endY = y + length - 1 ;
    var name = piece.data("name");
    var shipAttributes = {
      x: x, 
      y: y, 
      ship_id: ship,
      length: length,
      endpt: endPt,
      endY: endY,
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

    if((endY > 10) || (x == 1)) {
      $(piece).css("transform", "rotate(0deg)");
    }
  }
  
  $('.draggable').draggable({
    containment: "#wrapper",
    revert: 'invalid',
    scroll: false,
    stack: ".square",
    opacity: 0.6, 
    cursor: "move",
    handle: ".drag"
  });

  $('.piece').mousedown(function(){
    console.log(this);
    $('.lastClicked').removeClass('lastClicked');
    $(this).addClass('lastClicked');
  });

  $('#vert').on("click", function(){
    var piece = $('.lastClicked');
 
    if($(piece).css("transform") == 'none') {
      $(piece).css("transform", "rotate(90deg)").addClass('rotate');
      $(piece).css("transform");
    };
  });


});
    