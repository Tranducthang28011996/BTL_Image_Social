$(document).on('turbolinks:load', function(){
  $('body').on('click', '.notify-like', function(){
    $('body .block-content-notification').hide();
    $('body .block-loading').show();
    $(this).removeClass('has-new-notify')
      $.ajax({
        url: '/notification',
        method: 'GET',
        dateType: 'JSON',
        success: function(data){
          $('body .block-loading').fadeOut(500);
          $('body .block-content-notification').html(data.notifications)
          $('body .block-content-notification').fadeIn(500);
        }
      });
  });
});
