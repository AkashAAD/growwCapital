$(document).ready(function(){

	$("#tr-home-loan-resend-otp").click(function(){
		$.ajax({
	    url: "/transfer_home_loan/resend_otp",
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

	jQuery.validator.addMethod("tr_hom_is_pincode", function(value, element) {
		var status = false;
		var attr;
		if($(element).attr('id') == "transfer_home_loan_pincode") {
			attr = "#transfer_home_loan_city";
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

	$("#transfer_home_loan_state").change(function(evt) {
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
	    	$("#transfer_home_loan_city").html(options);
	    }
		});
	});

	$("#transfer_home_loan_offer_property_state").change(function(evt) {
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
	    	$("#transfer_home_loan_offer_property_city").html(options);
	    }
		});
	});

	$("#transfer_home_loan_is_topup_amount").change(function(evt) {
		if(evt.target.value == "true") {
      $(".desired-loan").removeClass("hide-div");
		} else {
			$("#transfer_home_loan_desired_loan_amount").val("0.00");
      $(".desired-loan").addClass("hide-div");
		}
	});

	$("#otp_transfer_home_loan").validate({
		rules: {
			"transfer_home_loan[otp]": {
				required: true,
				minlength: 6
			}
		},
		messages: {
			'transfer_home_loan[otp]': {
				required: 'Please enter OTP.',
				minlength: 'OTP should be 6 digits only.',
			}
		}
	});

	$("#basic_transfer_home_loan").validate({
		rules: {
			"transfer_home_loan[mobile_number]": {
				required: true,
				minlength: 10
			},
			'transfer_home_loan[annual_income]': {
				required: true
			},
			'transfer_home_loan[is_topup_amount]': {
				required: true
			},
			'transfer_home_loan[foreclose_loan_amount]': {
				required: true,
				maxlength: 10,
				valid_loan_amt: true
			},
			'transfer_home_loan[desired_loan_amount]': {
				required: true,
				maxlength: 10,
				valid_loan_amt: true
			},
			'transfer_home_loan[tenure]': {
				required: true
			},
			"transfer_home_loan[terms_and_conditions]": {
				required: true
			},
			"transfer_home_loan[property_city]": {
				required: true
			}
		},
		messages: {
			'transfer_home_loan[tenure]': {
				required: 'Please select tenure.'
			},
			'transfer_home_loan[is_topup_amount]': {
				required: "Please select topup amount option."
			},
			'transfer_home_loan[foreclose_loan_amount]': {
				required: 'Please enter loan amount.',
				maxlength: 'Loan amount must consist of at most 10 characters',
				valid_loan_amt: "Loan amount should be greator than or equal to ₹ 50,000."
			},
			'transfer_home_loan[desired_loan_amount]': {
				required: 'Please enter loan amount.',
				maxlength: 'Loan amount must consist of at most 10 characters',
				valid_loan_amt: "Loan amount should be greator than or equal to ₹ 50,000."
			},
			'transfer_home_loan[mobile_number]': {
				required: 'Please enter mobile number.',
				minlength: 'Mobile number must consist of at most 10 characters'
			},
			'transfer_home_loan[annual_income]': {
				required: 'Please enter annual income.',
			},
			"transfer_home_loan[terms_and_conditions]": {
				required: "Please select terms and conditions."
			},
			"transfer_home_loan[property_city]": {
				required: "Please select property city."
			}
		}
	});

  $("#update_transfer_home_offer").validate({
		rules: {
			"transfer_home_loan[dob]": {
				required: true
			},
			"transfer_home_loan[property_cost]": {
				required: true
			},
			"transfer_home_loan[employment_type]": {
				required: true
			},
			"transfer_home_loan[email]": {
				required: true,
				email: true
			},
			"transfer_home_loan[full_name]": {
				required: true,
				full_name: true
			},
		},
		messages: {
			'transfer_home_loan[dob]': {
				required: 'Please enter date of birth.',
				max: "For applying loan you should be minimum 21 years old.",
				min: "For applying loan you should be maximum 60 years old."
			},
			"transfer_home_loan[property_cost]": {
				required: "Please enter property cost."
			},
			"transfer_home_loan[employment_type]": {
				required: "Please select employment type."
			},
			"transfer_home_loan[email]": {
				required: "Please enter email",
				email: "Please enter validate email"
			},
			"transfer_home_loan[full_name]": {
				required: "Please enter full name.",
				full_name: "Please enter validate full name."
			},
		}
  });

  $("#transfer_home_loan_address").validate({
		rules: {
			"transfer_home_loan[address]": {
				required: true,
				minlength: 20
			},
			"transfer_home_loan[city]": {
				required: true
			},
			"transfer_home_loan[pincode]": {
				required: true,
				minlength: 6,
				tr_hom_is_pincode: true
			},
		},
		messages: {
			"transfer_home_loan[address]": {
				required: "Please enter address.",
				minlength: "Address must consist of at least 20 characters.",
			},
			"transfer_home_loan[city]": {
				required: "Please select city."
			},
			"transfer_home_loan[pincode]": {
				required: "Please enter pincode.",
				minlength: "Pincode must consist of at least 6 characters.",
			},
		}
	});

	$("#transfer_home_loan_assets").validate({
    errorPlacement: function(error, element) {
      element.parent().parent().append(error);
    },
		rules: {
			"transfer_home_loan[aadhar_front]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"transfer_home_loan[aadhar_back]": {
				required: true,
				file_type: true,
				file_size: true
			},
		},
		messages: {
			"transfer_home_loan[aadhar_front]": {
				required: 'Please select aadhar card front.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"transfer_home_loan[aadhar_back]": {
				required: 'Please select aadhar card back.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
		}
	})

});
