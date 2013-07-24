$(document).ready(function(){
  $('.best_in_place').best_in_place();  
  $('#edit_form').hide();
  $('button').on('click', function(){
    $('#edit_form').slideToggle();
  });
});

