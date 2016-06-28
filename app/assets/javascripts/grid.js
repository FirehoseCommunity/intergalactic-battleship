$(function() {

var rows = [];
var rowLabel = [" ","A", "B", "C", "D", "E", "F", "G", "H", "I", "J"];
var colLabel = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
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

});