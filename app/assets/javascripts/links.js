$( document ).ready(function() {
  $("#new-link").on("submit", function(event){
    event.preventDefault();
    var url = $(this).attr("action")
    value = $('#original_url').val()
    $.post( url, { original_url: value }, function( data ) {
      $("ul").append(data);
    });  
  });
});
