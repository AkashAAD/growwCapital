$(document).ready(function(){

	$("#professional-loan-resend-otp").click(function(){
		$.ajax({
	    url: "/professional_loan/resend_otp",
	    dataType: "json",
	    data: {},
	    success: function (data) {
	    	toastr["info"]("Your OTP has been sent successfully.", "info");
	    }
		});
	});

	jQuery.validator.addMethod("is_pan", function(value, element) {
	  return this.optional(element) || /^[A-Z]{5}[0-9]{4}[A-Z]{1}$/.test(value);
	}, "Entered pan number is invalid.");

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

	jQuery.validator.addMethod("pro_is_pincode", function(value, element) {
		var status = false;
		var attr;
		if($(element).attr('id') == "professional_loan_pincode") {
			attr = "#professional_loan_city";
		} else {
			attr = "#professional_loan_office_city";
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

	$("#professional_loan_state").change(function(evt) {
		$.ajax({
	    url: "/home/change_state",
	    dataType: "json",
	    data: {
	      state: evt.target.value
	    },
	    success: function (data) {
	    	var options = '';
	    	data.cities.forEach(function(val) {
	    		options+= '<option value="' + val[1] + '">'+val[0]+'</option>' 
	    	});
	    	$("#professional_loan_city").html(options);
	    }
		});
	});


	$("#professional_loan_profession_type").change(function(evt) {
		if(evt.target.value == 2) {
			$(".degree-yrs").html("Practice in years?");
		} else {
			$(".degree-yrs").html("Degree");
		}
		$.ajax({
	    url: "/home/change_profession",
	    dataType: "json",
	    data: {
	      id: evt.target.value
	    },
	    success: function (data) {
	    	var options = '';
	    	data.degrees.forEach(function(val) {
	    		options+= '<option value="' + val.id + '">' + val.name + '</option>' 
	    	});
	    	$("#professional_loan_degree").html(options);
	    }
		});
	});



	$("#otp_professional_loan").validate({
		rules: {
			"professional_loan[otp]": {
				required: true,
				minlength: 6
			}
		},
		messages: {
			'professional_loan[otp]': {
				required: 'Please enter OTP.',
				minlength: 'OTP should be 6 digits only.',
			}
		}
	});

	$("#basic_professional_loan").validate({
		rules: {
			"professional_loan[mobile_number]": {
				required: true,
				minlength: 10
			},
			'professional_loan[loan_amount]': {
				required: true,
				maxlength: 10,
				valid_loan_amt: true
			},
			'professional_loan[tenure]': {
				required: true
			},
			'professional_loan[profession_type]': {
				required: true
			},
			'professional_loan[annual_income]': {
				required: true
			},
			"professional_loan[terms_and_conditions]": {
				required: true
			}
		},
		messages: {
			'professional_loan[annual_income]': {
				required: "Please enter annual income."
			},
			'professional_loan[profession_type]': {
				required: "Please select profession type."
			},
			'professional_loan[tenure]': {
				required: 'Please select tenure.'
			},
			'professional_loan[loan_amount]': {
				required: 'Please enter loan amount.',
				maxlength: 'Loan amount must consist of at most 10 characters',
				valid_loan_amt: "Loan amount should be greator than or equal to ₹ 50,000."
			},
			'professional_loan[mobile_number]': {
				required: 'Please enter mobile number.',
				minlength: 'Mobile number must consist of at least 10 characters'
			},
			"professional_loan[terms_and_conditions]": {
				required: "Please select terms and conditions."
			}
		}
	});

	$("#update_professional_offer").validate({
		rules: {
			"professional_loan[bank_name]": {
				required: true
			},
			"professional_loan[full_name]": {
				required: true,
				full_name: true
			},
			"professional_loan[dob]": {
				required: true
			},
			"professional_loan[email]": {
				required: true,
				email: true
			},
		},
		messages: {
			"professional_loan[bank_name]": {
				required: "Please select bank name."
			},
			"professional_loan[full_name]": {
				required: "Please enter full name.",
				full_name: "Please enter valid full name."
			},
			"professional_loan[dob]": {
				required: "Please enter date of birth.",
				min: "For applying loan you should be minimum 21 years old.",
			},
			"professional_loan[email]": {
				required: "Please enter email",
				email: "Please enter validate email"
			},
		}
	});

  $("#professional_loan_address").validate({
		rules: {
			"professional_loan[address]": {
				required: true,
				minlength: 20
			},
			"professional_loan[city]": {
				required: true
			},
			"professional_loan[pincode]": {
				required: true,
				minlength: 6,
				pro_is_pincode: true
			},
			"professional_loan[office_address]": {
				required: true,
				minlength: 20
			},
			"professional_loan[office_city]": {
				required: true
			},
			"professional_loan[office_pincode]": {
				required: true,
				minlength: 6,
				pro_is_pincode: true
			},
		},
		messages: {
			"professional_loan[address]": {
				required: "Please enter address.",
				minlength: "Address must consist of at least 20 characters.",
			},
			"professional_loan[city]": {
				required: "Please select city."
			},
			"professional_loan[pincode]": {
				required: "Please enter pincode.",
				minlength: "Pincode must consist of at least 6 characters.",
			},
			"professional_loan[office_address]": {
				required: "Please enter address.",
				minlength: "Address must consist of at least 20 characters.",
			},
			"professional_loan[office_city]": {
				required: "Please select city."
			},
			"professional_loan[office_pincode]": {
				required: "Please enter pincode.",
				minlength: "Pincode must consist of at least 6 characters.",
			},
		}
	});

	$("#professional_loan_assets").validate({
    errorPlacement: function(error, element) {
      element.parent().parent().append(error);
    },
		rules: {
			"professional_loan[aadhar_front]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"professional_loan[aadhar_back]": {
				required: true,
				file_type: true,
				file_size: true
			},
		},
		messages: {
			"professional_loan[aadhar_front]": {
				required: 'Please select aadhar card front.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"professional_loan[aadhar_back]": {
				required: 'Please select aadhar card back.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
		}	
	})

});
