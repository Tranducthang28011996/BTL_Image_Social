$(document).ready(function() {
  $('body').on('click', '.btn-select-images', function() {
    $('#photo_image').click();
  });

  $('body').on('click', '.btn-done-report', function() {
    var report_id = $(this).attr('report-id');
    $this_button = $(this);
    $.ajax({
      url: '/admin/reports/' + report_id,
      type: 'PUT',
      dataType: 'JSON',
      data: {
        report: {
          done: 1
        }
      }
    })
    .done(function(data) {
      if (data == 1) {
        $this_button.replaceWith('<i class="fa fa-check"></i>');
      }
    })
  });

  $('body').on('click', '.btn-delete-photo', function() {
    $this_button = $(this);
    var photo_id = $this_button.parents('.photo-item').attr('photo-id');

    $.ajax({
      url: '/admin/photos/' + photo_id,
      type: 'PUT',
      dataType: 'JSON',
      data: {
        photo: {
          deleted: 1
        }
      }
    })
    .done(function(data) {
      if (data == 1) {
        $this_button
          .replaceWith('<button class="btn btn-primary btn-public-photo">Public</button>');
      }
    })
  });

  $('body').on('click', '.btn-public-photo', function() {
    $this_button = $(this);
    var photo_id = $this_button.parents('.photo-item').attr('photo-id');

    $.ajax({
      url: '/admin/photos/' + photo_id,
      type: 'PUT',
      dataType: 'JSON',
      data: {
        photo: {
          deleted: 0
        }
      }
    })
    .done(function(data) {
      if (data == 1) {
        $this_button
          .replaceWith('<button class="btn btn-danger btn-delete-photo">Delete</button>');
      }
    })
  });
});