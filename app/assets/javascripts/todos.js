$(document).ready(function(){
  $('.notes').hide();
  $('.best_in_place').best_in_place();
  $('button').on('click', function(){
    $('.notes').slideToggle();
  });
 });

