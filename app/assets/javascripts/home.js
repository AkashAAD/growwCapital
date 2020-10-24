$(document).ready(function(){
	$("#contact_us").validate({
		rules: {
			"contact_u[first_name]": {
				required: true
			},
			"contact_u[last_name]": {
				required: true
			},
			"contact_u[email]": {
				required: true
			},
			"contact_u[subject]": {
				required: true
			},
			"contact_u[message]": {
				required: true
			}
		},
		messages: {
			"contact_u[first_name]": {
				required: "Please enter first name"
			},
			"contact_u[last_name]": {
				required: "Please enter last name"
			},
			"contact_u[email]": {
				required: "Please enter email"
			},
			"contact_u[subject]": {
				required: "Please enter subject"
			},
			"contact_u[message]": {
				required: "Please enter message"
			}
		}
	});
});