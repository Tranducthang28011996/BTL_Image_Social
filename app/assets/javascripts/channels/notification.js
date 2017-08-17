App.messages = App.cable.subscriptions.create('NotificationChannel', {
  received: function(data) {
    $('.notify-like').css('background-position', '0 -349px');
  }
});
