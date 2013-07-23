$(document).ready(function(){
  $('#edit_form').hide();
  $('button').on('click', function(){
    $('#edit_form').slideToggle();
  });
});

$.ajax({
  url: 'ajax/test.html',
  success: function(data) {
    $('.result').html(data);
    alert('Load was performed.');
  }
});
