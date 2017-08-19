App.messages = App.cable.subscriptions.create('CommentChannel', {
  received: function(data) {
    var block_comment = "body #comment-photo-" + data['photo'];
    $(block_comment).append(data['content']);
    $(block_comment).scrollTop($(block_comment).offset().top);
  }
});
