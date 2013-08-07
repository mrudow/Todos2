$(document).ready(function(){
  $('.notes').hide();
  $('.best_in_place').best_in_place();
  $('button').on('click', function(){
    $(this).next('.notes').slideToggle();
    //$('.notes').slideToggle();
  }); 
  $('#submit_button').on('click', function(){
    window.location.replace("http://localhost:3000/todos");
  });
});


