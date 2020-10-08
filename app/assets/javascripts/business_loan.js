$(document).ready(function(){

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
	  return element.files[0].size < 5000000;
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
			"business_loan[mobile_number]": {
				required: true,
				maxlength: 10
			},
			"business_loan[first_name]": {
				required: true,
				maxlength: 50
			},
			"business_loan[middle_name]": {
				required: true,
				maxlength: 50
			},
			"business_loan[last_name]": {
				required: true,
				maxlength: 50
			},
			'business_loan[email]': {
				required: true,
				email: true
			},
			'business_loan[loan_amount]': {
				required: true,
				maxlength: 10
			},
			'business_loan[tenure]': {
				required: true
			}
		},
		messages: {
			'business_loan[tenure]': {
				required: 'Please select tenure.'
			},
			'business_loan[loan_amount]': {
				required: 'Please enter loan amount.',
				maxlength: 'Loan amount must consist of at most 10 characters'
			},
			'business_loan[mobile_number]': {
				required: 'Please enter mobile number.',
				maxlength: 'Mobile number must consist of at most 10 characters'
			},
			'business_loan[first_name]': {
				required: 'Please enter first name.',
				maxlength: 'First Name must consist of at most 50 characters'
			},
			'business_loan[middle_name]': {
				required: 'Please enter middle name.',
				maxlength: 'Middle Name must consist of at most 50 characters.'
			},
			'business_loan[last_name]': {
				required: 'Please enter last name.',
				maxlength: 'Middle Name must consist of at most 50 characters.'
			},
			'business_loan[email]': {
				required: 'Please enter office email.',
				email: 'Email should be valid.'
			},
		}
	});

  $("#business_loan").validate({
		rules: {
			"business_loan[dob]": {
				required: true
			},
			"business_loan[gender]": {
				required: true
			},
			"business_loan[marital_status]": {
				required: true
			},
			"business_loan[highest_qualification]": {
				required: true
			},
			"business_loan[no_of_dependent]": {
				required: true
			},
			"business_loan[current_residency_since_year]": {
				required: true
			},
			"business_loan[current_city_since_year]": {
				required: true
			},
			"business_loan[pan_number]": {
				required: true,
				maxlength: 10,
				is_pan: true
			},
			"business_loan[purpose_of_loan]": {
				required: true,
				maxlength: 50
			},
			"business_loan[residential_type]": {
				required: true
			},
			"business_loan[address_line1]": {
				required: true,
				maxlength: 150
			},
			"business_loan[address_line2]": {
				required: true,
				maxlength: 150
			},
			"business_loan[landmark]": {
				required: true,
				maxlength: 50
			},
			"business_loan[state]": {
				required: true
			},
			"business_loan[city]": {
				required: true
			},
			"business_loan[pincode]": {
				required: true,
				maxlength: 6
			},
		},
		messages: {
			'business_loan[dob]': {
				required: 'Please enter date of birth.'
			},
			'business_loan[gender]': {
				required: 'Please select gender.'
			},
			'business_loan[marital_status]': {
				required: 'Please select marital status.'
			},
			'business_loan[highest_qualification]': {
				required: 'Please select highest qualification.'
			},
			'business_loan[no_of_dependent]': {
				required: 'Please select number of dependents.'
			},
			'business_loan[current_residency_since_year]': {
				required: 'Please select stying in current residence since.'
			},
			'business_loan[current_city_since_year]': {
				required: 'Please select stying at current city since.'
			},
			'business_loan[pan_number]': {
				required: 'Please enter pan number.',
				maxlength: 'Pan number must consist of at most 10 characters.',
				is_pan: 'Entered pan number is invalid.'
			},
			'business_loan[purpose_of_loan]': {
				required: 'Please select purpose of loan.'
			},
			'business_loan[address_line1]': {
				required: 'Please enter address_line1.',
				maxlength: 'Address line1 must consist of at most 150 characters.'
			},
			'business_loan[address_line2]': {
				required: 'Please enter address line2.',
				maxlength: 'Address line2 must consist of at most 150 characters.'
			},
			'business_loan[landmark]': {
				required: 'Please enter landmark.',
				maxlength: 'Landmark must consist of at most 150 characters.'
			},
			'business_loan[state]': {
				required: 'Please select enter state.'
			},
			'business_loan[city]': {
				required: 'Please select enter city.'
			},
			'business_loan[pincode]': {
				required: 'Please enter pincode.',
				maxlength: 'pincode must consist of at most 6 characters.'
			},
			'business_loan[residential_type]': {
				required: 'Please selecy enter residential type.'
			}
		}  	
  });

  $("#business_loan_offer").validate({
		rules: {
			"business_loan_offer[business_name]": {
				required: true,
				maxlength: 50
			},
			"business_loan_offer[business_nature]": {
				required: true
			},
			"business_loan_offer[residence_type]": {
				required: true
			},
			"business_loan_offer[industry_type]": {
				required: true
			},
			"business_loan_offer[business_years]": {
				required: true
			},
			"business_loan_offer[current_emi]": {
				required: true,
				maxlength: 10
			},
			"business_loan_offer[annual_turnover]": {
				required: true,
				maxlength: 10
			},
			"business_loan_offer[gross_annual_profit]": {
				required: true,
				maxlength: 10
			},
			"business_loan_offer[business_pan_number]": {
				required: true,
				maxlength: 10,
				is_pan: true
			},
			"business_loan_offer[gst_number]": {
				required: true,
				maxlength: 50
			},
			"business_loan_offer[address_line1]": {
				required: true,
				maxlength: 150
			},
			"business_loan_offer[address_line2]": {
				required: true,
				maxlength: 150
			},
			"business_loan_offer[landmark]": {
				required: true,
				maxlength: 50
			},
			"business_loan_offer[state]": {
				required: true
			},
			"business_loan_offer[city]": {
				required: true
			},
			"business_loan_offer[pincode]": {
				required: true,
				maxlength: 6
			}
		},
		messages: {
			"business_loan_offer[business_name]": {
				required: 'Please enter business name.',
				maxlength: 'Business name must consist of at most 50 characters'
			},
			"business_loan_offer[business_nature]": {
				required: 'Please select business nature.'
			},
			"business_loan_offer[residence_type]": {
				required: 'Please select business property type.'
			},
			"business_loan_offer[industry_type]": {
				required: 'Please select business industry type.'
			},
			"business_loan_offer[business_years]": {
				required: 'Please select business business years.'
			},
			"business_loan_offer[current_emi]": {
				required: 'Please enter current EMI.',
				maxlength: 'current EMI must consist of at most 10 characters'
			},
			"business_loan_offer[annual_turnover]": {
				required: 'Please enter annual turnover.',
				maxlength: 'Annual turnover must consist of at most 10 characters'
			},
			"business_loan_offer[gross_annual_profit]": {
				required: 'Please enter gross annual profit.',
				maxlength: 'gross annual profit must consist of at most 10 characters'
			},
			"business_loan_offer[business_pan_number]": {
				required: 'Please enter business pan number.',
				maxlength: 'Business pan number must consist of at most 10 characters.',
				is_pan: 'Entered business pan number is invalid.'
			},
			"business_loan_offer[gst_number]": {
				required: 'Please enter gst number.',
				maxlength: 'gst number must consist of at most 50 characters'
			},
			'business_loan_offer[address_line1]': {
				required: 'Please enter address_line1.',
				maxlength: 'Address line1 must consist of at most 150 characters.'
			},
			'business_loan_offer[address_line2]': {
				required: 'Please enter address line2.',
				maxlength: 'Address line2 must consist of at most 150 characters.'
			},
			'business_loan_offer[landmark]': {
				required: 'Please enter landmark.',
				maxlength: 'Landmark must consist of at most 150 characters.'
			},
			'business_loan_offer[state]': {
				required: 'Please select enter state.'
			},
			'business_loan_offer[city]': {
				required: 'Please select enter city.'
			},
			'business_loan_offer[pincode]': {
				required: 'Please enter pincode.',
				maxlength: 'pincode must consist of at most 6 characters.'
			},
		}  	
  });

	$("#business_loan_offer_assets").validate({
		rules: {
			"business_loan_offer[bank_statement]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"business_loan_offer[id_proof]": {
				required: true,
				file_type: true,
				file_size: true				
			},
			"business_loan_offer[residential_address_proof]": {
				required: true,
				file_type: true,
				file_size: true				
			},
			"business_loan_offer[office_address_proof]": {
				required: true,
				file_type: true,
				file_size: true				
			},
			"business_loan_offer[itr_copy]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"business_loan_offer[passport_photo]": {
				required: true,
				file_type: true,
				file_size: true				
			}
		},
		messages: {
			'business_loan_offer[bank_statement]': {
				required: 'Please select bank statement.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 5 mb.'
			},
			'business_loan_offer[id_proof]': {
				required: 'Please select id proof.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 5 mb.'				
			},
			'business_loan_offer[residential_address_proof]': {
				required: 'Please select residential address proof.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 5 mb.'				
			},
			'business_loan_offer[office_address_proof]': {
				required: 'Please select office address proof.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 5 mb.'				
			},
			'business_loan_offer[itr_copy]': {
				required: 'Please select itr copy.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 5 mb.'				
			},
			'business_loan_offer[passport_photo]': {
				required: 'Please select passport photo.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 5 mb.'				
			}
		}
	});

});
