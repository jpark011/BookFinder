if($("#course_name").length != 0) {
	var courses = [];
	if(!courses.length) {
		$.ajax({
			url: "/courses/match",
			dataType: "json",
			success: function (response) {
				$.each(response, function (index, value) {
					courses.push(value)
				});
			}
		})
	}
}
$("#course_name").autocomplete({
	open: function () {
		$(".ui-menu").width(190);
	},
	source: courses, 
	delay: 700
});
