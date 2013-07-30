$(document).ready(function () {
	hideAllFamilies = function() {
		$('.family-details-card').hide();
	}

	getFilteredFamilies = function(familySize) {
		console.log("called getFilteredFamilies");
		$('#filter-family-form').on("ajax:complete", function() {
			console.log("The ajax call was complete");
		});
	}

	showFilteredFamilies = function (families) {
		console.log("called showFilteredFamilies");
		$('.families-to-adopt').html("<h3>Families go here</h3>");
	}

	filterFamilies = function() {
		$('#family-size-filter-buttons').on('click', 'input', function(e) {
			var filterBySize = e.currentTarget.value;
			console.log(filterBySize);
			var families = getFilteredFamilies(filterBySize);
			hideAllFamilies();
			showFilteredFamilies(families);
		});
	}

	filterFamilies();
});