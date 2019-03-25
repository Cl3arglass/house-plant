$(document).ready(function() {
	$("a.comments_view").on("click", function(e) {
	

	$.getJSON(this.href).success(function(json) {
	  var $ol = $("div.comments ol");
	  $ol.html("");

	  json.forEach(function(comment){
	  	if (comment.note) {
	  	  $ol.append("<li>" + "*"+ comment.note + "</li>");
	  	}
	  })
	  
	})
	e.preventDefault();
  })
})