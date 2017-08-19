$(function(){
  $('body').on('click', '.notify-like', function(){
    $('.block-content-notification').hide();
    $('.block-loading').show();
    // $('.notification-block').toggle();

      $.ajax({
        url: '/notification',
        method: 'GET',
        dateType: 'JSON',
        success: function(data){
          console.log(data);
          $('.block-loading').fadeOut(500);
          $('.block-content-notification').html(data.notifications)
          $('.block-content-notification').fadeIn(500);
        }
      });
  });

  // $(document).click(function(e){
  //   if ($(e.target).is('.notification-block')) {
  //   }else
  //   if ($(e.target).is('.notify-block')) {
  //   }else
  //   if ($(e.target).is('.notify-like')) {
  //   }else {
  //     $('.notification-block').hide();
  //   }
  // });

});
