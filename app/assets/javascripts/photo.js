$(document).on('turbolinks:load', function(){
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
      $(textarea).val('');
      $(textarea).val().replace("\n", "");
    })
    return false;
  });

  $('body').on('keypress', '.form-add-comment', function(event){
    var keyCode = (event.keyCode ? event.keyCode : event.which);
    if (keyCode == 13) {
      $(this).closest('form').children('.btn-send-comment').trigger('click');
    }
  });


  $('body').on('click', '.button-like-comment', function(e){
    e.preventDefault();
    var photo_id = $(this).closest('.like-comment').data('photo');
    var block_count_like = $(this).closest('.like-comment').children('.count-like');
    var block_like = $(this);
    var url = '/like/' + photo_id;
    var method = $(this).attr('method');

    if (method == "delete") {
      url = '/unlike/' + photo_id;
    }

    $.ajax({
      url: url,
      method: method,
      dataType: 'JSON'
    })
    .done(function(data) {
      if (block_like.hasClass('liked')) {
        block_like.removeClass('liked').addClass('not-like');
        block_like.attr('method', 'post');
      }else {
        block_like.removeClass('not-like').addClass('liked');
        block_like.attr('method', 'delete');
      }

      block_count_like.html('<strong>' + data.count_like + ' likes</strong>')
    })
  });

  $(window).scroll(function (event) {
      if ($(window).scrollTop() == $(document).height() - $(window).height()){
        var page = Math.floor($(window).scrollTop()/3800 + 1);

        if (page > 1) {
          $.ajax({
            url: '/photos',
            type: 'GET',
            dataType: 'JSON',
            data: {page: page},
          })
          .done(function(data) {
            $('.photo-posts').append(data.posts);
          })
        }
      }
  });

  $('body').on('click', '.frame-photo', function(){
    var photo_id = $(this).data('photo-id');
    $.ajax({
      url: '/photos/' + photo_id,
      type: 'GET',
      dataType: 'JSON'
    })
    .done(function(data) {
      $('#myModal .modal-content').html(data.photo);
    })
  });
});
