
$(document).ready(function() {
	$("#new_comment").on('submit', function(e) {
		var comment = $("#comment-field").val();

		if(comment == '')
			return false;
	});
});