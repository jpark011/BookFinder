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
