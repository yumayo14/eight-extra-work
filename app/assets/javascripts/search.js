$(document).on('turbolinks:load',function(){
  $(function() {
    $(".tab__item").on("click", function() {
      $(".search-searched_company_list").hide();
      $('.tab').find('.left').css('background-color', '#307caf');
      $('.left').find('.tab__item').css('color', 'white');
      $('.tab').find('.right').css('background-color', 'white');
      $('.right').find('.tab__item2').css('color', '#307caf');
    });
    $(".tab__item2").on("click", function() {
      $(".search-searched_company_list").show();
      $('.tab').find('.right').css('background-color', '#307caf');
      $('.right').find('.tab__item2').css('color', 'white');
      $('.tab').find('.left').css('background-color', 'white');
      $('.left').find('.tab__item').css('color', '#307caf');
    });
  });
});
