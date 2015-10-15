var ready = function() {
   //sanity check
   console.log("Don't Panic!");

   $("#drop-btn").click(function() {
      console.log('clicked!');
      $("#profile-wrapper").slideToggle();
   });
};

$(document).ready(ready);
$(document).on('page:load', ready);

$("#profile-wrapper").hide();
