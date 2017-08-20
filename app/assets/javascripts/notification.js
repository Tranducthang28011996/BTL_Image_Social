$(function(){
  $('body').on('click', '.notify-like', function(){
    $('.block-content-notification').hide();
    $('.block-loading').show();
    $(this).removeClass('has-new-notify')
      $.ajax({
        url: '/notification',
        method: 'GET',
        dateType: 'JSON',
        success: function(data){
          $('.block-loading').fadeOut(500);
          $('.block-content-notification').html(data.notifications)
          $('.block-content-notification').fadeIn(500);
        }
      });
  });
});
