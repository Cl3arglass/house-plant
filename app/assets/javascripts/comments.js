$(document).ready(function() {
	$("a.comments_view").on("click", function(e) {
	

	$.getJSON(this.href).success(function(json) {
	  console.log(json)
	  
	})
	e.preventDefault();
  })
})