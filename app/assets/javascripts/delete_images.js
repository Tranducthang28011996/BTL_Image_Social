$(document).on('turbolinks:load', function(){
  $('body').on('click', '.delete-image', function(e){
    var imageID = $(this).closest('.delete-image').data('image');
    $.ajax({
          url: '/photos/' + imageID,
          dataType: 'JSON',
          method: "DELETE",
          data: {imageID: imageID}
        })
        .done(function(data) {
          $(".fade-out-image-"+ imageID).fadeOut(200);
        })
  });
});
