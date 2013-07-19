$(document).ready(function(){
  $('#edit_form').hide();
  $('button').on('click', function(){
    $('#edit_form').slideToggle();
  });
});
