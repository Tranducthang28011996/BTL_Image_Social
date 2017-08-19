$(document).on('turbolinks:load', function(){
  $('body').on('click', '.btn-report', function() {
    var user_id = $(this).parents('.photo-item').attr('user-id');
    var photo_id = $(this).parents('.photo-item').attr('photo-id');

    $.ajax({
      url: '/reports',
      type: 'POST',
      dataType: 'JSON',
      data: {
        report: {
          user_id: user_id,
          photo_id: photo_id
        }
      }
    })
    .done(function(data) {
      if (data.status == 1) {
        alert('Report successfuly!');
      }
    })
  });

  $('body').on('click', '.btn-public', function() {
    var photo_id = $(this).parents('.photo-item').attr('photo-id');

    $.ajax({
      url: '/photos/' + photo_id,
      type: 'PUT',
      dataType: 'JSON',
      data: {
        photo: {
          status: 1,
        }
      }
    })
    .done(function(data) {
    })
  });

  $('body').on('click', '.btn-private', function() {
    var photo_id = $(this).parents('.photo-item').attr('photo-id');

    $.ajax({
      url: '/photos/' + photo_id,
      type: 'PUT',
      dataType: 'JSON',
      data: {
        photo: {
          status: 0,
        }
      }
    })
    .done(function(data) {
    })
  });
});