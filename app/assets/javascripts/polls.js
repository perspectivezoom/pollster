
$(function() {
  $('form input:radio').click( function() {
    if( $(this).val() == 'free_response' ) {
      $(this).siblings('.possible_responses').css('display','none');
    } else {
      $(this).siblings('.possible_responses').css('display','block');
    }
  })
});