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

$(document).ready(function() {
	$("a.comments_view_sorted").on("click", function(e) {
	

	$.getJSON(this.href).success(function(json) {
	  var $ol = $("div.comments ol");
	  $ol.html("");

	  json.sort(function(a, b) {
		  var nameA = (a.note) ? a.note.toUpperCase() : ""; 
		  var nameB = (b.note) ? b.note.toUpperCase() : ""; 
		  if (nameA < nameB) {
		    return -1;
		  }
		  if (nameA > nameB) {
		    return 1;
	      }

 
		  return 0;
	  });

	  json.forEach(function(comment){
	  	if (comment.note) {
	  	  $ol.append("<li>" + "*"+ comment.note + "</li>");
	  	}
	  })
	  
	})
	e.preventDefault();
  })
})