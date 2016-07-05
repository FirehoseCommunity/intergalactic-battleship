$(function() {
  
  $('.moveable').draggable({
    cursor: 'move',
    stack: '.battleship-grid'
    
  });
  
  $('#grid').droppable({
    accept: ".ship-img",
    drop: function(event, ui) {
      var dropped = ui.draggable;

      $('.moveable').click(function() {
          $(this).toggleClass('rotate');
      });
    }
  });

  

  

   


});