App.messages = App.cable.subscriptions.create('NotificationChannel', {
  received: function(data) {
    $('body .notify-like').addClass('has-new-notify');
  }
});
