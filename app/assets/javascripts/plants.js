$(document).ready(function() {
	$("a.plant_view").on("click", function(e) {
	$.ajax({ 
	  method: "GET",
	  url: this.href
	}).done(function(data) {
	  var $div = $(".plant_content")
	  $div.empty();
	  $div.append(data);
	});
	e.preventDefault();
  })
})
