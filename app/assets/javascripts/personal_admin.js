//= require jquery.min.js
//= require jquery-ui.js
//= require bootstrap.min.js
//= require chosen-jquery

function show_confirm(){
  var r = confirm("Are you sure?");

  if(r == false) {
    event.preventDefault();
    return false;
  }
}
