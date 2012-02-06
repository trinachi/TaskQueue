// $(document).ready(function() {
//   $("#tasks > li h3").click(function() {
//     $(this).parents("li").addClass("expand");
//   });
// });

$(document).ready(function() {
  $("#tasks > li div.more_info").hide();
  $("#tasks > li h3").toggle(function() {
    $(this).parents("li").find(".more_info").show("fast");
	}, function(){
		$(this).parents("li").find(".more_info").hide("fast");
  });
});