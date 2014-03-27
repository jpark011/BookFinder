$("#course_name").autocomplete({
	open: function () {
		$(".ui-menu").width(190);
	},
	source: "/courses/match", 
	select: function( event, ui ) {
		$("#course_name").val(ui.item.value);
		$("#search-btn").click();
	}
});

function validateCourse(data) {
		if(data.length == 0) {
			$("#error-msg").text = "Course does not exist!";
			event.preventDefault();
		}
}

$("#search").submit(function(event) {
	$.ajax({
		url: "/courses/match",
		data: {term: $("#course_name").val()},
		async: false,
		success: function validateCourse(data) {
				if(data.length == 0) {
					$("#error-msg").text("Course does not exist!");
					event.preventDefault();
				}
		}
	});
});



