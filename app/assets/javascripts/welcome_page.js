$(document).ready(function(){
  console.log("what?")

  $("#signup_button").on("click", function(e){
      e.preventDefault();
      console.log("poop")

    $.ajax({
      url: $("#signup_link").attr("href"),
      method: $("#signup_link").attr("method"),
      success: function(response){
        var signup_form = $(response).find("#sign_up_form");
           $("#opening_forms").html(signup_form[0])
      }
    })
  });




  $("#login_link").on("click", function(e){
      e.preventDefault();

      $.ajax({
        url: $(this).attr("href"),
        method: $(this).attr("method"),
        success: function(response){
          var login_form = $(response).find("#login_form");
            $("#opening_forms").html(login_form[0])
        }

      })
  });


});