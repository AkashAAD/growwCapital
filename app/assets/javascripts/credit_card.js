$(document).ready(function() {

	jQuery.validator.addMethod("file_type", function(value, element) {
		var types = ['application/pdf', 'image/png', 'image/jpeg', 'image/jpg']
	  return types.includes(element.files[0].type);
	}, "");

	jQuery.validator.addMethod("file_size", function(value, element) {
	  return element.files[0].size < 15000000;
	}, "");

	jQuery.validator.addMethod("valid_salary", function(value, element) {
		return parseFloat(value) >= 15000;
	}, "");

	jQuery.validator.addMethod("full_name", function(value, element) {
	  return value.split(" ").length >= 2;
	}, "");

	jQuery.validator.addMethod("email", function(value, element) {
	  return this.optional(element) || /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(value);
	}, "");

	jQuery.validator.addMethod("valid_loan_amt", function(value, element) {
		return parseFloat(value) >= 50000;
	}, "");

	jQuery.validator.addMethod("crd_is_pincode", function(value, element) {
		var status = false;
		var attr;
		if($(element).attr('id') == "credit_card_office_pincode") {
			attr = "#credit_card_office_city";
		} else {
			attr = "#credit_card_city";
		}
		$.ajax({
	    url: "/home/check_pincode?pincode=" + value + "&city=" + $(attr).val(),
	    success: function (data) {
	    	if(data.pincode_status) {
	    		status = true;
	    	} else {
	    		status = false;
	    	}
	    },
	    async: false
		});
		return status;
	}, "Please enter valid pincode.");

	$("#basic_credit_card").validate({
		rules: {
			"credit_card[mobile_number]": {
				required: true,
				minlength: 10
			},
			"credit_card[terms_and_conditions]": {
				required: true
			},
		},
		messages: {
			"credit_card[terms_and_conditions]": {
				required: "Please select terms and conditions."
			},
			'credit_card[mobile_number]': {
				required: 'Please enter mobile number.',
				minlength: 'Mobile number must consist of at most 10 characters'
			},
		}
	});

	$("#otp_credit_card").validate({
		rules: {
			"credit_card[otp]": {
				required: true,
				minlength: 6
			}
		},
		messages: {
			'credit_card[otp]': {
				required: 'Please enter OTP.',
				minlength: 'OTP should be 6 digits only.',
			}
		}
	});

	$("#update_card_offer").validate({
		rules: {
			"credit_card[employment_type]": {
				required: true
			},
			"credit_card[full_name]": {
				required: true,
				full_name: true
			},
			"credit_card[dob]": {
				required: true
			},
			"credit_card[email]": {
				required: true,
				email: true
			},
			"credit_card[existing_card]": {
				required: true
			}
		},
		messages: {
			"credit_card[employment_type]": {
				required: "Please select employment type."
			},
			"credit_card[full_name]": {
				required: "Please enter full name.",
				full_name: "Please enter valid full name."
			},
			"credit_card[dob]": {
				required: "Please enter date of birth.",
				max: "For applying loan you should be minimum 21 years old.",
			},
			"credit_card[email]": {
				required: "Please enter email.",
				email: "Please enter valid email."
			},
			"credit_card[existing_card]": {
				required: "Please select existing card option."
			}
		}
	});

  $("#credit_card_address").validate({
		rules: {
			"credit_card[address]": {
				required: true,
				minlength: 20
			},
			"credit_card[city]": {
				required: true
			},
			"credit_card[pincode]": {
				required: true,
				minlength: 6,
				crd_is_pincode: true
			},
			"credit_card[office_address]": {
				required: true,
				minlength: 20
			},
			"credit_card[office_city]": {
				required: true
			},
			"credit_card[office_pincode]": {
				required: true,
				minlength: 6,
				crd_is_pincode: true				
			},
		},
		messages: {
			"credit_card[address]": {
				required: "Please enter address.",
				minlength: "Address must consist of at least 20 characters.",
			},
			"credit_card[city]": {
				required: "Please select city."
			},
			"credit_card[pincode]": {
				required: "Please enter pincode.",
				minlength: "Pincode must consist of at least 6 characters."
			},
			"credit_card[office_address]": {
				required: "Please enter address.",
				minlength: "Address must consist of at least 20 characters.",
			},
			"credit_card[office_city]": {
				required: "Please select city."
			},
			"credit_card[office_pincode]": {
				required: "Please enter pincode.",
				minlength: "Pincode must consist of at least 6 characters."
			},
		}
	});

	$("#credit_card_assets").validate({
    errorPlacement: function(error, element) {
      element.parent().parent().append(error);
    },
		rules: {
			"credit_card[aadhar_front]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"credit_card[aadhar_back]": {
				required: true,
				file_type: true,
				file_size: true
			},
		},
		messages: {
			"credit_card[aadhar_front]": {
				required: 'Please select aadhar card front.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"credit_card[aadhar_back]": {
				required: 'Please select aadhar card back.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
		}
	});

});
