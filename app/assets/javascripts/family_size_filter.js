$(document).ready(function () {
	
	getFilteredFamilies = function(familySize) {
		console.log("called getFilteredFamilies");
		$('#filter-family-form').on("ajax:success", function(event, data) {
			console.log("getFilteredFamilies AJAX call");
			console.log(data);
		});
	}

	showFilteredFamilies = function (families) {
		console.log("called showFilteredFamilies");
		$('.families-to-adopt').html("<h4>Families will go here</h4>");
	}

	hideAllFamilies = function() {
		$('.family-details-card').hide();
	}


	filterFamilies = function() {
		$('#family-size-filter-buttons input').last().on('click', function(e) {
			var filterBySize = e.currentTarget.value;
			console.log(filterBySize);
			var families = getFilteredFamilies(filterBySize);
			hideAllFamilies();
			showFilteredFamilies(families);
		});
	}

	filterFamilies();
});