$(document).ready(function(){
  $('.notes').hide();
  $('#error1').hide();
  $('#error2').hide();
  $('.best_in_place').best_in_place();
  $('button').on('click', function(){
    $(this).next('.notes').slideToggle();
    //$('.notes').slideToggle();
  }); 
  /*$('#submit_button').on('click', function(){
    window.location.replace("http://localhost:3000/todos");
  });*/
  $('.pos').focusout(function(){
    location.reload();
  });
  $('.checkbox').click(function(){
    $('.checkbox').mouseleave(function(){
      location.reload();
    });
  });
});


