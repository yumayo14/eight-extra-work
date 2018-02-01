$(document).on('turbolinks:load', function () {
  $(function() {
    $('.nav-btn').on('click', function() {
    var menuId = $(this).attr("id");
      $('#menubox_' + menuId).toggle();
    })
  })
})
