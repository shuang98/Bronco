$(document).on('click', '#edit-section', function(event) {
	event.preventDefault();
	/* Act on the event */
	$('#new-section-form').fadeToggle();
	$('.delete-section').fadeToggle();
});
$(document).on('click', '.section-link', function(event) {
	event.preventDefault();
	var section_id = $(this).attr('id');
	$('.section-link').css('background-color', 'white');
	$(this).css('background-color', 'lightgrey');
	$('.section-form').hide();
	$('#section-form-' + section_id).show();
});
$(document).on('click', '.add-body', function(event) {
	event.preventDefault();
	var section_id = $(this).attr('id');
	var course_id = $('.course-id').attr('id');
	$.get('/courses/' + course_id + '/sections/buildbody', {section_id: section_id}, function(data) {
		$('#section-form-' + section_id).html(data);
	});
});
$(document).on('click', '.delete-section', function(event) {
	event.preventDefault();
	var section_id = $(this).attr('id');
	var course_id = $('.course-id').attr('id');
	$.ajax({
    	url: '/courses/' + course_id + '/sections/' + section_id,
    	type: 'DELETE',
    	success: function(result) {
    		$('li#' + section_id).hide();
    	}
	});
});




