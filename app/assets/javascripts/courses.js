$("#course_name").autocomplete({
	open: function () {
		$(".ui-menu").width(190);
	},
	source: "/courses/match", 
	delay: 200
});
