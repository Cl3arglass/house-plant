function Plant(attributes) {
	this.id = attributes.id;
	this.name = attributes.name;
	this.light = attributes.light;
	this.watering = attributes.watering;
	this.comment = attributes.comment.note;
}

// $(function(){
// 	Plant.templateSource = $("#plant-template").html();
// 	Plant.template = Handlebars.compile(Plant.templateSource);
// })

Plant.prototype.renderContent = function() {
	return Plant.template(this);
}

Plant.edit = function(){
	$("a.plant_edit").on("click", function(e) {
	
	$.get(this.href).success(function(response) {
	  var $div = $(".plant_content")
	  $div.empty();
	  
	  

	  $div.append(response)
      
	  
	})
	   e.preventDefault()
	   
	})
}


$(document).ready(function() {
	$("a.plant_view").on("click", function(e) {
    Plant.templateSource = $("#plant-template").html();
	Plant.template = Handlebars.compile(Plant.templateSource);
	

	$.getJSON(this.href).success(function(json) {
	  var $div = $(".plant_content")
	  $div.empty();
	  
	  var plant = new Plant(json);
	  var plantContent = plant.renderContent()

	  $div.append(plantContent)
      Plant.edit()
	  
	})
	e.preventDefault();
  })
})

$(function(){
	$("form#new_plant").on("submit", function(e){
		e.preventDefault()
		console.log("captured!!")
	})
})



