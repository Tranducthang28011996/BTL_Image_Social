$(document).on('turbolinks:load', function(){
  $('body').on('click', '.btn-follow', function(e){
    e.preventDefault();

    var url = $(this).attr('href');
    var method = $(this).data('method');

    $.ajax({
      url: url,
      method: method,
      dataType: 'JSON'
    })
    .done(function(data) {
      $('.block-follow').html(data.form_follow)
    })

    return false;
  });

  $('body').on('click', '.show-icon-change-image', function(e){
    e.preventDefault();
    var url = $(this).data('link');
    $.ajax({
      url: url,
      type: 'GET',
      dataType: 'JSON',
    })
    .done(function(data) {
      $('.modal-content').html(data.form_edit_avatar);
      $('#myModal').modal();
    })
    return false;
  });
});
