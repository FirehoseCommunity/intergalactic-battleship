$(function() {

 
  
  $('.moveable').draggable({
    stack: '.battleship-grid',
    cursor:'move',
    revert: true
    
  });

  
  $('td').droppable({
    drop: handleDrop 

  });

  function handleDrop(event, ui) {
    var droppedShip = ui.draggable;
    droppedShip.position({
      of: $(this),
      my: 'left top',
      at: 'left top'
    });
    droppedShip.draggable('option', 'revert', false);
    droppedShip.draggable('option', 'grid', [46, 46]);

    $('.moveable').click(function() {
    $(this).toggleClass('rotate');
    });
  }

  

  

  

   


});