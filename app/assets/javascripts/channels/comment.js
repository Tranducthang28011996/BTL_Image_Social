App.messages = App.cable.subscriptions.create('CommentChannel', {
  received: function(data) {
    var block_comment = "#comment-photo-" + data['photo'];
    $(block_comment).append(data['content']);
  }
});
