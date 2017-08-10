$(document).ready(function() {
  $('body').on('click', '.btn-select-images', function() {
    $('#photo_image').click();
  });

  $('body').on('click', '.btn-done-report', function() {
    var report_id = $(this).attr('report-id');

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
        alert(1);
      }
    })
  });
});