$(document).ready(function() {
	$('#new_recomendation').validate({
		rules: {
			"recomendation[body]": {required: true},
			"recomendation[mark]": {required: true, min: 0, max: 5}
		}
	});
});