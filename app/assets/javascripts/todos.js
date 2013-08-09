$(document).ready(function(){
  $('.notes').hide();
  $('.best_in_place').best_in_place();
  $('button').on('click', function(){
    $(this).next('.notes').slideToggle();
  }); 
  $('.pos').focusout(function(){
    location.reload();
  });
  $('.checkbox').click(function(){
    $('.checkbox').mouseleave(function(){
      location.reload();
    });
  });
});


