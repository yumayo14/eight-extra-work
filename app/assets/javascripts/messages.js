$(document).on('turbolinks:load', function () {
  $(function() {
    function buildHTML(message){
      var html = `<div class = "chat_space" >
                    <div class = "chat_space__avatar" >
                      <div class = "thumbnail" >
                        <a href="/users/${message.receiver_id}"><i class="fa fa-user fa-3x"></i></a>
                      </div>
                    </div>
                    <div class = "chat_space__content" >
                      <div class = "chat_space__content__user_info" >
                        <div class = "chat_space__content__user_info__person" >
                          ${message.name}
                        </div>
                        <div class = "chat_space__content__user_info__post-time" >
                          ${message.created_at}
                        </div>
                      </div>
                      <div class = "chat_space__content__chat" >
                        ${message.message}
                      </div>
                    </div>
                  </div>`

      return html;
    }

    $(".new_message").on("submit",function(e) {
      e.preventDefault();
      var formData = new FormData(this);

      $.ajax({
        url: $(this).attr('action'),
        type: 'POST',
        data: formData,
        dataType: "json",
        processData: false,
        contentType: false
      })
      .done(function(data){
        var html = buildHTML(data);
        $(".chat_screen").append(html);
        $(".text-field").val("");
      })
      .fail(function(){
        alert('error')
      })
    })
  })
})
