$(document).ready(function(){

	$("#business-loan-resend-otp").click(function(){
		$.ajax({
	    url: "/business_loan/resend_otp",
	    dataType: "json",
	    data: {},
	    success: function (data) {
	    	toastr["info"]("Your OTP has been sent successfully.", "info");
	    }
		});
	});

	$("#business_loan_state").change(function(evt) {
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
	    	$("#business_loan_city").html(options);
	    }
		});
	});

	$("#business_loan_offer_state").change(function(evt) {
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
	    	$("#business_loan_offer_city").html(options);
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

	$("#otp_business_loan").validate({
		rules: {
			"business_loan[otp]": {
				required: true,
				maxlength: 6
			}
		},
		messages: {
			'business_loan[otp]': {
				required: 'Please enter OTP.',
				required: 'OTP should be 6 digits only.',
			}
		}
	});

	$("#basic_business_loan").validate({
		rules: {
			"business_loan[annual_turnover]": {
				required: true,
			},
			'business_loan[loan_amount]': {
				required: true,
				maxlength: 10
			},
			'business_loan[tenure]': {
				required: true
			},
			'business_loan[gross_annual_profit]': {
				required: true
			},
			"business_loan[terms_and_conditions]": {
				required: true
			}
		},
		messages: {
			"business_loan[annual_turnover]": {
				required: "Please select annual turnover.",
			},
			'business_loan[loan_amount]': {
				required: "Please enter loan amount"
			},
			'business_loan[tenure]': {
				required: "Please select tenure."
			},
			'business_loan[gross_annual_profit]': {
				required: "Please enter gross annual profit."
			},
			"business_loan[terms_and_conditions]": {
				required: "Please select terms and conditions."
			}
		}
	});

  $("#update_business_offer").validate({
		rules: {
			'business_loan[company_type]': {
				required: true
			},
			'business_loan[business_nature]': {
				required: true
			},
			'business_loan[bank_name]': {
				required: true
			},
			'business_loan[current_emi]': {
				required: true
			},
			'business_loan[full_name]': {
				required: true
			},
			'business_loan[dob]': {
				required: true
			},
			'business_loan[mobile_number]': {
				required: true
			},
			'business_loan[email]': {
				required: true
			},
		},
		messages: {
			'business_loan[company_type]': {
				required: "Please select company type."
			},
			'business_loan[business_nature]': {
				required: "Please select business nature."
			},
			'business_loan[bank_name]': {
				required: "Please select bank name."
			},
			'business_loan[current_emi]': {
				required: "Please enter current EMI"
			},
			'business_loan[full_name]': {
				required: "Please enter full name"
			},
			'business_loan[dob]': {
				required: "Please enter date of birth."
			},
			'business_loan[mobile_number]': {
				required: "Please enter mobile number."
			},
			'business_loan[email]': {
				required: "Please enter email address."
			},		
		}  	
  });

  $("#business_loan_address").validate({
		rules: {
			"business_loan[address]": {
				required: true
			},
			"business_loan[city]": {
				required: true
			},
			"business_loan[pincode]": {
				required: true,
				minlength: 6
			},
			"business_loan[business_address]": {
				required: true
			},
			"business_loan[business_city]": {
				required: true
			},
			"business_loan[business_pincode]": {
				required: true,
				minlength: 6
			}
		},
		messages: {
			"business_loan[address]": {
				required: "Please enter address."
			},
			"business_loan[city]": {
				required: "Please select city."
			},
			"business_loan[pincode]": {
				required: "Please enter pincode.",
				minlength: "Pincode must consist of at least 6 characters.",
			},
			"business_loan[business_address]": {
				required: "Please enter business address."
			},
			"business_loan[business_city]": {
				required: "Please enter business city."
			},
			"business_loan[business_pincode]": {
				required: "Please enter pincode",
				minlength: "Pincode must consist of at least 6 characters.",
			}
		} 	
  });

	$("#business_loan_offer_assets").validate({
    errorPlacement: function(error, element) {
      element.parent().parent().append(error);
    },
		rules: {
			"business_loan[aadhar_card_front]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"business_loan[aadhar_card_back]": {
				required: true,
				file_type: true,
				file_size: true				
			},
			"business_loan[shockup_licence]": {
				required: true,
				file_type: true,
				file_size: true				
			},
		},
		messages: {
			'business_loan[aadhar_card_front]': {
				required: 'Please select aadhar card front.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			'business_loan[aadhar_card_back]': {
				required: 'Please select aadhar card back.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'				
			},
			'business_loan[shockup_licence]': {
				required: 'Please select shockup 	licence.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'				
			},
		}
	});

});
