$(document).on('turbolinks:load', function () {
  var currentModalContent = null;
  var modalClassSyncer = "modal_syncer";

  var modals = document.getElementsByClassName ( modalClassSyncer );

  for(var i=0,l=modals.length; l>i; i++){

    modals[ i ].onclick = function(){
      $(this).blur() ;
      var target = this.getAttribute( "data-target" );
      console.log("%s", target);
      currentModalContent = document.getElementById ( target );
      console.log("%s", currentModalContent);

      if($("#modal_overlay")[0]) return false ;
      $("body").append('<div id="modal_overlay"></div>');

      centeringModelSyncer();

      $("#modal_overlay").fadeIn("slow");
      $(currentModalContent).fadeIn("slow")

      $(document).on("click", "#modal_close, #modal_overlay", function () {
        $(`#${target}, #modal-overlay`).fadeOut("slow", function() {
          $("#modal_overlay").remove();
        })
      })
    currentModalContent = null;
   }
  }

  function centeringModelSyncer(){
    var w = $(window).width();
    var h = $(window).height();

    var cw = $(currentModalContent).outerWidth();
    var ch = $(currentModalContent).outerHeight();

    var pxleft = ((w - cw)/2);
    var pxtop = ((h - ch)/2);

    $(currentModalContent).css({"left": pxleft + "px"});
    $(currentModalContent).css({"top": pxtop + "px"});
  }
})
