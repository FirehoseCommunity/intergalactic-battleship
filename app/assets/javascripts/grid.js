$(function() {

  var rows = [];
  var rowLabel = [" ", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; 
  var colLabel = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"];
  var cellFill = null;
  var rowStr = null;
  var colStr = null;

  for(var i = 0; i < 11; i++) {
    cellFill = " ";
    rowStr = " ";
    colStr = " ";

    //label rows
    var rLabel = '<td id="battleship-grid">' + rowLabel[i] + '</td>';
    rowStr += rLabel;

    for (var j = 0; j < 10; j++){
      //label columns
      if(i == 0) {
        var cLabel = '<td id="battleship-grid">' + colLabel[j] + '</td>';
        colStr += cLabel;
       } else { 
        //individual cells
        var cell = '<td id="battleship-grid">' + " " + '</td>';
        cellFill += cell;
      }
    };
    rows.push('<tr>' + rowStr + colStr + cellFill + '</tr>');
  }
  document.getElementById('grid').innerHTML += rows.join("");

  
  $('.ship-img').draggable({
    // containment: '#table-grid',
    cursor: 'move',
    stack: '#battleship-grid'
    
  });
  
  $('#grid').droppable({
    accept: ".ship-img",
    drop: function(event, ui) {
      var dropped = ui.draggable;

      var angle = 90;
      $('.ship-img').click(function(){

        $(this).css ({
            '-webkit-transform': 'rotate(' + angle + 'deg)',
            '-moz-transform': 'rotate(' + angle + 'deg)',
            '-o-transform': 'rotate(' + angle + 'deg)',
            '-ms-transform': 'rotate(' + angle + 'deg)'
        });
        angle+=90;
        
      });
    }

  });

  

  

   


});