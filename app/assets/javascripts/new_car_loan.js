$(document).ready(function(){
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

	$("#new_car_loan_state").change(function(evt) {
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
	    	$("#new_car_loan_city").html(options);
	    }
		});
	});

	$("#otp_new_car_loan").validate({
		rules: {
			"new_car_loan[otp]": {
				required: true,
				maxlength: 6
			}
		},
		messages: {
			'new_car_loan[otp]': {
				required: 'Please enter OTP.',
				required: 'OTP should be 6 digits only.',
			}
		}
	});

	$("#basic_new_car_loan").validate({
		rules: {
			"new_car_loan[mobile_number]": {
				required: true,
				maxlength: 10
			},
			"new_car_loan[first_name]": {
				required: true,
				maxlength: 50
			},
			"new_car_loan[middle_name]": {
				required: true,
				maxlength: 50
			},
			"new_car_loan[last_name]": {
				required: true,
				maxlength: 50
			},
			'new_car_loan[email]': {
				required: true,
				email: true
			},
			'new_car_loan[loan_amount]': {
				required: true,
				maxlength: 10
			},
			'new_car_loan[tenure]': {
				required: true
			},
			"new_car_loan[terms_and_conditions]": {
				required: true
			}
		},
		messages: {
			'new_car_loan[tenure]': {
				required: 'Please select tenure.'
			},
			'new_car_loan[loan_amount]': {
				required: 'Please enter loan amount.',
				maxlength: 'Loan amount must consist of at most 10 characters'
			},
			'new_car_loan[mobile_number]': {
				required: 'Please enter mobile number.',
				maxlength: 'Mobile number must consist of at most 10 characters'
			},
			'new_car_loan[first_name]': {
				required: 'Please enter first name.',
				maxlength: 'First Name must consist of at most 50 characters'
			},
			'new_car_loan[middle_name]': {
				required: 'Please enter middle name.',
				maxlength: 'Middle Name must consist of at most 50 characters.'
			},
			'new_car_loan[last_name]': {
				required: 'Please enter last name.',
				maxlength: 'Middle Name must consist of at most 50 characters.'
			},
			'new_car_loan[email]': {
				required: 'Please enter office email.',
				email: 'Email should be valid.'
			},
			"new_car_loan[terms_and_conditions]": {
				required: "Please select terms and conditions."
			}
		}
	});

  $("#new_car_loan").validate({
		rules: {
			"new_car_loan[dob]": {
				required: true
			},
			"new_car_loan[gender]": {
				required: true
			},
			"new_car_loan[marital_status]": {
				required: true
			},
			"new_car_loan[highest_qualification]": {
				required: true
			},
			"new_car_loan[no_of_dependent]": {
				required: true
			},
			"new_car_loan[current_residency_since_year]": {
				required: true
			},
			"new_car_loan[current_city_since_year]": {
				required: true
			},
			"new_car_loan[pan_number]": {
				required: true,
				maxlength: 10,
				is_pan: true
			},
			"new_car_loan[purpose_of_loan]": {
				required: true,
				maxlength: 50
			},
			"new_car_loan[residential_type]": {
				required: true
			},
			"new_car_loan[address_line1]": {
				required: true,
				maxlength: 150
			},
			"new_car_loan[address_line2]": {
				required: true,
				maxlength: 150
			},
			"new_car_loan[landmark]": {
				required: true,
				maxlength: 50
			},
			"new_car_loan[state]": {
				required: true
			},
			"new_car_loan[city]": {
				required: true
			},
			"new_car_loan[pincode]": {
				required: true,
				maxlength: 6
			}
		},
		messages: {
			'new_car_loan[dob]': {
				required: 'Please enter date of birth.'
			},
			'new_car_loan[gender]': {
				required: 'Please select gender.'
			},
			'new_car_loan[marital_status]': {
				required: 'Please select marital status.'
			},
			'new_car_loan[highest_qualification]': {
				required: 'Please select highest qualification.'
			},
			'new_car_loan[no_of_dependent]': {
				required: 'Please select number of dependents.'
			},
			'new_car_loan[current_residency_since_year]': {
				required: 'Please select stying in current residence since.'
			},
			'new_car_loan[current_city_since_year]': {
				required: 'Please select stying at current city since.'
			},
			'new_car_loan[pan_number]': {
				required: 'Please enter pan number.',
				maxlength: 'Pan number must consist of at most 10 characters.',
				is_pan: 'Entered pan number is invalid.'
			},
			'new_car_loan[purpose_of_loan]': {
				required: 'Please select purpose of loan.'
			},
			'new_car_loan[address_line1]': {
				required: 'Please enter address_line1.',
				maxlength: 'Address line1 must consist of at most 150 characters.'
			},
			'new_car_loan[address_line2]': {
				required: 'Please enter address line2.',
				maxlength: 'Address line2 must consist of at most 150 characters.'
			},
			'new_car_loan[landmark]': {
				required: 'Please enter landmark.',
				maxlength: 'Landmark must consist of at most 150 characters.'
			},
			'new_car_loan[state]': {
				required: 'Please select enter state.'
			},
			'new_car_loan[city]': {
				required: 'Please select enter city.'
			},
			'new_car_loan[pincode]': {
				required: 'Please enter pincode.',
				maxlength: 'pincode must consist of at most 6 characters.'
			},
			'new_car_loan[residential_type]': {
				required: 'Please selecy enter residential type.'
			}
		}  	
  });

  $("#new_car_loan_offer").validate({
		rules: {
			"new_car_loan_offer[name]": {
				required: true
			},
		},
		messages: {
			'new_car_loan_offer[name]': {
				required: 'Please enter name.',
			},
		}
	});

	$("#new_car_loan_assets").validate({
		rules: {
			"new_car_loan[persoanl_bank_statement]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"new_car_loan[business_bank_statement]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"new_car_loan[id_proof]": {
				required: true,
				file_type: true,
				file_size: true				
			},
			"new_car_loan[salary_slip]": {
				required: true,
				file_type: true,
				file_size: true				
			},
			"new_car_loan[itr_copy]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"new_car_loan[passport_photo]": {
				required: true,
				file_type: true,
				file_size: true
			}
		},
		messages: {
			"new_car_loan[persoanl_bank_statement]": {
				required: 'Please select persoanl bank statement.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"new_car_loan[business_bank_statement]": {
				required: 'Please select business bank statement',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"new_car_loan[id_proof]": {
				required: 'Please select id proof',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'			
			},
			"new_car_loan[salary_slip]": {
				required: 'Please select salary slip',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'	
			},
			"new_car_loan[itr_copy]": {
				required: 'Please select itr copy',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"new_car_loan[passport_photo]": {
				required: 'Please select passport photo',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			}
		}
	})

});
