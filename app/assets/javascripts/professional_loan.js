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


	$("#professional_loan_offer_profession_type").change(function(evt) {
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
	    	$("#professional_loan_offer_degree").html(options);
	    }
		});
	});



	$("#otp_professional_loan").validate({
		rules: {
			"professional_loan[otp]": {
				required: true,
				maxlength: 6
			}
		},
		messages: {
			'professional_loan[otp]': {
				required: 'Please enter OTP.',
				required: 'OTP should be 6 digits only.',
			}
		}
	});

	$("#basic_professional_loan").validate({
		rules: {
			"professional_loan[mobile_number]": {
				required: true,
				minlength: 10
			},
			"professional_loan[first_name]": {
				required: true,
				maxlength: 50
			},
			"professional_loan[middle_name]": {
				required: true,
				maxlength: 50
			},
			"professional_loan[last_name]": {
				required: true,
				maxlength: 50
			},
			'professional_loan[email]': {
				required: true,
				email: true
			},
			'professional_loan[loan_amount]': {
				required: true,
				maxlength: 10
			},
			'professional_loan[tenure]': {
				required: true
			},
			"professional_loan[terms_and_conditions]": {
				required: true
			}
		},
		messages: {
			'professional_loan[tenure]': {
				required: 'Please select tenure.'
			},
			'professional_loan[loan_amount]': {
				required: 'Please enter loan amount.',
				maxlength: 'Loan amount must consist of at most 10 characters'
			},
			'professional_loan[mobile_number]': {
				required: 'Please enter mobile number.',
				minlength: 'Mobile number must consist of at least 10 characters'
			},
			'professional_loan[first_name]': {
				required: 'Please enter first name.',
				maxlength: 'First Name must consist of at most 50 characters'
			},
			'professional_loan[middle_name]': {
				required: 'Please enter middle name.',
				maxlength: 'Middle Name must consist of at most 50 characters.'
			},
			'professional_loan[last_name]': {
				required: 'Please enter last name.',
				maxlength: 'Middle Name must consist of at most 50 characters.'
			},
			'professional_loan[email]': {
				required: 'Please enter office email.',
				email: 'Email should be valid.'
			},
			"professional_loan[terms_and_conditions]": {
				required: "Please select terms and conditions."
			}
		}
	});

  $("#professional_loan").validate({
		rules: {
			"professional_loan[dob]": {
				required: true
			},
			"professional_loan[gender]": {
				required: true
			},
			"professional_loan[marital_status]": {
				required: true
			},
			"professional_loan[highest_qualification]": {
				required: true
			},
			"professional_loan[no_of_dependent]": {
				required: true
			},
			"professional_loan[current_residency_since_year]": {
				required: true
			},
			"professional_loan[current_city_since_year]": {
				required: true
			},
			"professional_loan[pan_number]": {
				required: true,
				maxlength: 10,
				is_pan: true
			},
			"professional_loan[purpose_of_loan]": {
				required: true,
				maxlength: 50
			},
			"professional_loan[residential_type]": {
				required: true
			},
			"professional_loan[address_line1]": {
				required: true,
				maxlength: 150
			},
			"professional_loan[address_line2]": {
				required: true,
				maxlength: 150
			},
			"professional_loan[landmark]": {
				required: true,
				maxlength: 50
			},
			"professional_loan[state]": {
				required: true
			},
			"professional_loan[city]": {
				required: true
			},
			"professional_loan[pincode]": {
				required: true,
				maxlength: 6
			}
		},
		messages: {
			'professional_loan[dob]': {
				required: 'Please enter date of birth.'
			},
			'professional_loan[gender]': {
				required: 'Please select gender.'
			},
			'professional_loan[marital_status]': {
				required: 'Please select marital status.'
			},
			'professional_loan[highest_qualification]': {
				required: 'Please select highest qualification.'
			},
			'professional_loan[no_of_dependent]': {
				required: 'Please select number of dependents.'
			},
			'professional_loan[current_residency_since_year]': {
				required: 'Please select stying in current residence since.'
			},
			'professional_loan[current_city_since_year]': {
				required: 'Please select stying at current city since.'
			},
			'professional_loan[pan_number]': {
				required: 'Please enter pan number.',
				maxlength: 'Pan number must consist of at most 10 characters.',
				is_pan: 'Entered pan number is invalid.'
			},
			'professional_loan[purpose_of_loan]': {
				required: 'Please select purpose of loan.'
			},
			'professional_loan[address_line1]': {
				required: 'Please enter address_line1.',
				maxlength: 'Address line1 must consist of at most 150 characters.'
			},
			'professional_loan[address_line2]': {
				required: 'Please enter address line2.',
				maxlength: 'Address line2 must consist of at most 150 characters.'
			},
			'professional_loan[landmark]': {
				required: 'Please enter landmark.',
				maxlength: 'Landmark must consist of at most 150 characters.'
			},
			'professional_loan[state]': {
				required: 'Please select enter state.'
			},
			'professional_loan[city]': {
				required: 'Please select enter city.'
			},
			'professional_loan[pincode]': {
				required: 'Please enter pincode.',
				maxlength: 'pincode must consist of at most 6 characters.'
			},
			'professional_loan[residential_type]': {
				required: 'Please selecy enter residential type.'
			}
		}  	
  });


	$("#professional_loan_offer").validate({
		rules: {
			"professional_loan_offer[profession_type]": {
				required: true
			},
			"professional_loan_offer[degree]": {
				required: true
			},
			"professional_loan_offer[current_profession_since_year]": {
				required: true
			},
			"professional_loan_offer[annual_income]": {
				required: true,
				maxlength: 10
			},
			"professional_loan_offer[current_emi]": {
				required: true,
				maxlength: 10
			}
		},
		messages: {
			"professional_loan_offer[profession_type]": {
				required: "Please select profession type."
			},
			"professional_loan_offer[degree]": {
				required: "Please select degree."
			},
			"professional_loan_offer[current_profession_since_year]": {
				required: "Please select profession years since."
			},
			"professional_loan_offer[annual_income]": {
				required: "Please enter annual income.",
				maxlength: "Annual income must consist of at most 10 characters."
			},
			"professional_loan_offer[current_emi]": {
				required: "Please enter current emi.",
				maxlength: "Current emi must consist of at most 10 characters."
			}
		}
	});




	$("#professional_loan_assets").validate({
		rules: {
			"professional_loan[id_proof]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"professional_loan[bank_statement]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"professional_loan[residential_address_proof]": {
				required: true,
				file_type: true,
				file_size: true				
			},
			"professional_loan[office_address_proof]": {
				required: true,
				file_type: true,
				file_size: true				
			},
			"professional_loan[degree]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"professional_loan[registration_certificate]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"professional_loan[itr_copy]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"professional_loan[passport_photo]": {
				required: true,
				file_type: true,
				file_size: true
			}
		},
		messages: {
			'professional_loan[id_proof]': {
				required: 'Please select id proof.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"professional_loan[bank_statement]": {
				required: 'Please select bank statement',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"professional_loan[residential_address_proof]": {
				required: 'Please select residential address proof',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'	
			},
			"professional_loan[office_address_proof]": {
				required: 'Please select office address proof',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'	
			},
			"professional_loan[degree]": {
				required: 'Please select degree',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"professional_loan[registration_certificate]": {
				required: 'Please select registration certificate',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"professional_loan[itr_copy]": {
				required: 'Please select itr copy',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"professional_loan[passport_photo]": {
				required: 'Please select passport photo',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			}
		}		
	})

});
