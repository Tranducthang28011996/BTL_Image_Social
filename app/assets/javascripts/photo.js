$(document).ready(function(){
  $('body').on('click', '.btn-send-comment', function(e){
    e.preventDefault();
    var url = $(this).closest('.new_comment').attr('action');
    var content_comment = $(this).closest('.new_comment').children('textarea').val();
    var block_comment = $(this).closest('.like-comment').children('.post-comments');
    var textarea = $(this).closest('.new_comment').children('textarea');

    $.ajax({
      url: url,
      type: 'POST',
      dataType: 'JSON',
      data: {comment: {content: content_comment}}
    })
    .done(function(data) {
      if (data.status == true) {
        $(data.comment).appendTo(block_comment).hide().fadeIn(1000);
        $(textarea).val('');
        $(textarea).val().replace("\n", "");
      }
    })
  });

  $('body').on('keypress', '.form-add-comment', function(event){
    var keyCode = (event.keyCode ? event.keyCode : event.which);
    if (keyCode == 13) {
      $('.btn-send-comment').trigger('click');
    }
  });
});
