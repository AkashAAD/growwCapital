$(document).ready(function(){

	$("#loan-against-property-resend-otp").click(function(){
		$.ajax({
	    url: "/loan_against_property/resend_otp",
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

	jQuery.validator.addMethod("lap_is_pincode", function(value, element) {
		var status = false;
		var attr;
		if($(element).attr('id') == "loan_against_property_pincode") {
			attr = "#loan_against_property_city";
		} else {
			attr = "#";
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

	$("#loan_against_property_state").change(function(evt) {
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
	    	$("#loan_against_property_city").html(options);
	    }
		});
	});

	$("#loan_against_property_offer_property_state").change(function(evt) {
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
	    	$("#loan_against_property_offer_property_city").html(options);
	    }
		});
	});


	$("#loan_against_property_offer_property_type").change(function(evt) {
		var property_types = ['flat', 'consturcted_property', 'commercial_property'];
		if($.inArray(evt.target.value, property_types) >= 0) {
			$("#loan_against_property_offer_buildup_area").prop("readonly", false);
			$("#loan_against_property_offer_buildup_area").val('');
		} else {
			$("#loan_against_property_offer_buildup_area").prop("readonly", true);
			$("#loan_against_property_offer_buildup_area").val('0');
		}
	});

	$("#otp_loan_against_property").validate({
		rules: {
			"loan_against_property[otp]": {
				required: true,
				minlength: 6
			}
		},
		messages: {
			'loan_against_property[otp]': {
				required: 'Please enter OTP.',
				minlength: 'OTP should be 6 digits only.',
			}
		}
	});

	$("#basic_loan_against_property").validate({
		rules: {
			"loan_against_property[mobile_number]": {
				required: true,
				minlength: 10
			},
			'loan_against_property[annual_income]': {
				required: true
			},
			'loan_against_property[loan_amount]': {
				required: true,
				maxlength: 10,
				valid_loan_amt: true
			},
			'loan_against_property[tenure]': {
				required: true
			},
			"loan_against_property[terms_and_conditions]": {
				required: true
			},
			"loan_against_property[property_city]": {
				required: true
			}
		},
		messages: {
			'loan_against_property[tenure]': {
				required: 'Please select tenure.'
			},
			'loan_against_property[loan_amount]': {
				required: 'Please enter loan amount.',
				maxlength: 'Loan amount must consist of at most 10 characters',
				valid_loan_amt: "Loan amount should be greator than or equal to ₹ 50,000."
			},
			'loan_against_property[mobile_number]': {
				required: 'Please enter mobile number.',
				minlength: 'Mobile number must consist of at least 10 characters'
			},
			'loan_against_property[annual_income]': {
				required: 'Please enter annual income.',
			},
			"loan_against_property[terms_and_conditions]": {
				required: "Please select terms and conditions."
			},
			"loan_against_property[property_city]": {
				required: "Please select property city."
			}
		}
	});

  $("#update_against_property_offer").validate({
		rules: {
			"loan_against_property[dob]": {
				required: true
			},
			"loan_against_property[property_cost]": {
				required: true
			},
			"loan_against_property[employment_type]": {
				required: true
			},
			"loan_against_property[email]": {
				required: true,
				email: true
			},
			"loan_against_property[full_name]": {
				required: true,
				full_name: true
			},
		},
		messages: {
			'loan_against_property[dob]': {
				required: 'Please enter date of birth.',
				min: "For applying loan you should be minimum 21 years old.",
				max: "For applying loan you should be maximum 60 years old."
			},
			"loan_against_property[property_cost]": {
				required: "Please enter property cost."
			},
			"loan_against_property[employment_type]": {
				required: "Please select employment type."
			},
			"loan_against_property[email]": {
				required: "Please enter email",
				email: "Please enter validate email"
			},
			"home_loan[full_name]": {
				required: "Please enter full name.",
				full_name: "Please enter validate full name."
			},
		}   	
  });

  $("#loan_against_property_address").validate({
		rules: {
			"loan_against_property[address]": {
				required: true,
				minlength: 20
			},
			"loan_against_property[city]": {
				required: true
			},
			"loan_against_property[pincode]": {
				required: true,
				minlength: 6,
				lap_is_pincode: true
			},
		},
		messages: {
			"loan_against_property[address]": {
				required: "Please enter address.",
				minlength: "Address must consist of at least 20 characters.",
			},
			"loan_against_property[city]": {
				required: "Please select city."
			},
			"loan_against_property[pincode]": {
				required: "Please enter pincode.",
				minlength: "Pincode must consist of at least 6 characters.",
			},
		}
	});

	$("#loan_against_property_assets").validate({
	  errorPlacement: function(error, element) {
      element.parent().parent().append(error);
    },
		rules: {
			"loan_against_property[aadhar_front]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"loan_against_property[aadhar_back]": {
				required: true,
				file_type: true,
				file_size: true
			},
		},
		messages: {
			"loan_against_property[aadhar_front]": {
				required: 'Please select aadhar card front.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"loan_against_property[aadhar_back]": {
				required: 'Please select aadhar card back.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
		}
	})

});
