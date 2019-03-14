$(document).ready(function() {
	$("a.plant_view").on("click", function(e) {
	

	$.getJSON(this.href).success(function(json) {
	  var $div = $(".plant_content")
	  $div.empty();
	  console.log(json)
	})
	e.preventDefault();
  })
})
