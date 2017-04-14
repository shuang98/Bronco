$(document).on('click', '#new-section', function(event) {
	event.preventDefault();
	/* Act on the event */
	$('#new-section-form').fadeToggle();
});
$(document).on('click', '.section-link', function(event) {
	event.preventDefault();
	var section_id = $(this).attr('id');
	$('.section-link').css('background-color', 'white');
	$(this).css('background-color', 'lightgrey');
	$('.section-view').hide();
	$('#section-view-' + section_id).show();
});

