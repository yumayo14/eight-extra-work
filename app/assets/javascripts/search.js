$(document).on('turbolinks:load',function(){
  $(function() {
    $("#my_network").on("click", function() {
      $("#eight_network_search").hide();
      $("#my_network_search").show();
      $('.tab').find('.left').css('background-color', '#307caf');
      $('.left').find('.tab__item').css('color', 'white');
      $('.tab').find('.right').css('background-color', 'white');
      $('.right').find('.tab__item2').css('color', '#307caf');
    });
    $("#eight_network").on("click", function() {
      $("#my_network_search").hide();
      $("#eight_network_search").show();
      $('.tab').find('.right').css('background-color', '#307caf');
      $('.right').find('.tab__item2').css('color', 'white');
      $('.tab').find('.left').css('background-color', 'white');
      $('.left').find('.tab__item').css('color', '#307caf');
    });
  });
});
