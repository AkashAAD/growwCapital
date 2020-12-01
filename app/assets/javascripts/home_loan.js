$(document).ready(function(){

	$("#home-loan-resend-otp").click(function(){
		$.ajax({
	    url: "/home_loan/resend_otp",
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

	$("#home_loan_state").change(function(evt) {
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
	    	$("#home_loan_city").html(options);
	    }
		});
	});

	$("#home_loan_offer_property_state").change(function(evt) {
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
	    	$("#home_loan_offer_property_city").html(options);
	    }
		});
	});

	$("#otp_home_loan").validate({
		rules: {
			"home_loan[otp]": {
				required: true,
				maxlength: 6
			}
		},
		messages: {
			'home_loan[otp]': {
				required: 'Please enter OTP.',
				minlength: 'OTP should be 6 digits only.',
			}
		}
	});

	$("#basic_home_loan").validate({
		rules: {
			"home_loan[mobile_number]": {
				required: true,
				minlength: 10
			},
			'home_loan[annual_income]': {
				required: true
			},
			'home_loan[loan_amount]': {
				required: true,
				maxlength: 10
			},
			'home_loan[tenure]': {
				required: true
			},
			"home_loan[terms_and_conditions]": {
				required: true
			},
			"home_loan[property_city]": {
				required: true
			}
		},
		messages: {
			'home_loan[tenure]': {
				required: 'Please select tenure.'
			},
			'home_loan[loan_amount]': {
				required: 'Please enter loan amount.',
				maxlength: 'Loan amount must consist of at most 10 characters'
			},
			'home_loan[mobile_number]': {
				required: 'Please enter mobile number.',
				minlength: 'Mobile number must consist of at most 10 characters'
			},
			'home_loan[annual_income]': {
				required: 'Please enter annual income.',
			},
			"home_loan[terms_and_conditions]": {
				required: "Please select terms and conditions."
			},
			"home_loan[property_city]": {
				required: "Please select property city."
			}
		}
	});

  $("#update_home_offer").validate({
		rules: {
			"home_loan[dob]": {
				required: true
			},
			"home_loan[property_cost]": {
				required: true
			},
			"home_loan[employment_type]": {
				required: true
			},
			"home_loan[current_emi]": {
				required: true
			},
			"home_loan[email]": {
				required: true,
				email: true
			},
		},
		messages: {
			'home_loan[dob]': {
				required: 'Please enter date of birth.'
			},
			"home_loan[property_cost]": {
				required: "Please enter property cost."
			},
			"home_loan[employment_type]": {
				required: "Please select employment type."
			},
			"home_loan[current_emi]": {
				required: "Please enter current EMI."
			},
			"home_loan[email]": {
				required: "Please enter email",
				email: "Please enter validate email"
			},
		}  	
  });

  $("#home_loan_address").validate({
		rules: {
			"home_loan[address]": {
				required: true
			},
			"home_loan[city]": {
				required: true
			},
			"home_loan[pincode]": {
				required: true,
				minlength: 6
			},
		},
		messages: {
			"home_loan[address]": {
				required: "Please enter address."
			},
			"home_loan[city]": {
				required: "Please select city."
			},
			"home_loan[pincode]": {
				required: "Please enter pincode.",
				minlength: "Pincode must consist of at least 6 characters.",
			},
		}
	});

	$("#home_loan_assets").validate({
    errorPlacement: function(error, element) {
      element.parent().parent().append(error);
    },
		rules: {
			"home_loan[aadhar_front]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"home_loan[aadhar_back]": {
				required: true,
				file_type: true,
				file_size: true
			},
		},
		messages: {
			"home_loan[aadhar_front]": {
				required: 'Please select aadhar card front.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"home_loan[aadhar_back]": {
				required: 'Please select aadhar card back.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
		}
	})

});
