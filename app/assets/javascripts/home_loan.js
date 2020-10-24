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
				required: 'OTP should be 6 digits only.',
			}
		}
	});

	$("#basic_home_loan").validate({
		rules: {
			"home_loan[mobile_number]": {
				required: true,
				maxlength: 10
			},
			"home_loan[first_name]": {
				required: true,
				maxlength: 50
			},
			"home_loan[middle_name]": {
				required: true,
				maxlength: 50
			},
			"home_loan[last_name]": {
				required: true,
				maxlength: 50
			},
			'home_loan[email]': {
				required: true,
				email: true
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
				maxlength: 'Mobile number must consist of at most 10 characters'
			},
			'home_loan[first_name]': {
				required: 'Please enter first name.',
				maxlength: 'First Name must consist of at most 50 characters'
			},
			'home_loan[middle_name]': {
				required: 'Please enter middle name.',
				maxlength: 'Middle Name must consist of at most 50 characters.'
			},
			'home_loan[last_name]': {
				required: 'Please enter last name.',
				maxlength: 'Middle Name must consist of at most 50 characters.'
			},
			'home_loan[email]': {
				required: 'Please enter office email.',
				email: 'Email should be valid.'
			},
			"home_loan[terms_and_conditions]": {
				required: "Please select terms and conditions."
			}
		}
	});

  $("#home_loan").validate({
		rules: {
			"home_loan[dob]": {
				required: true
			},
			"home_loan[gender]": {
				required: true
			},
			"home_loan[marital_status]": {
				required: true
			},
			"home_loan[highest_qualification]": {
				required: true
			},
			"home_loan[no_of_dependent]": {
				required: true
			},
			"home_loan[current_residency_since_year]": {
				required: true
			},
			"home_loan[current_city_since_year]": {
				required: true
			},
			"home_loan[pan_number]": {
				required: true,
				maxlength: 10,
				is_pan: true
			},
			"home_loan[purpose_of_loan]": {
				required: true,
				maxlength: 50
			},
			"home_loan[residential_type]": {
				required: true
			},
			"home_loan[address_line1]": {
				required: true,
				maxlength: 150
			},
			"home_loan[address_line2]": {
				required: true,
				maxlength: 150
			},
			"home_loan[landmark]": {
				required: true,
				maxlength: 50
			},
			"home_loan[state]": {
				required: true
			},
			"home_loan[city]": {
				required: true
			},
			"home_loan[pincode]": {
				required: true,
				maxlength: 6
			}
		},
		messages: {
			'home_loan[dob]': {
				required: 'Please enter date of birth.'
			},
			'home_loan[gender]': {
				required: 'Please select gender.'
			},
			'home_loan[marital_status]': {
				required: 'Please select marital status.'
			},
			'home_loan[highest_qualification]': {
				required: 'Please select highest qualification.'
			},
			'home_loan[no_of_dependent]': {
				required: 'Please select number of dependents.'
			},
			'home_loan[current_residency_since_year]': {
				required: 'Please select stying in current residence since.'
			},
			'home_loan[current_city_since_year]': {
				required: 'Please select stying at current city since.'
			},
			'home_loan[pan_number]': {
				required: 'Please enter pan number.',
				maxlength: 'Pan number must consist of at most 10 characters.',
				is_pan: 'Entered pan number is invalid.'
			},
			'home_loan[purpose_of_loan]': {
				required: 'Please select purpose of loan.'
			},
			'home_loan[address_line1]': {
				required: 'Please enter address_line1.',
				maxlength: 'Address line1 must consist of at most 150 characters.'
			},
			'home_loan[address_line2]': {
				required: 'Please enter address line2.',
				maxlength: 'Address line2 must consist of at most 150 characters.'
			},
			'home_loan[landmark]': {
				required: 'Please enter landmark.',
				maxlength: 'Landmark must consist of at most 150 characters.'
			},
			'home_loan[state]': {
				required: 'Please select enter state.'
			},
			'home_loan[city]': {
				required: 'Please select enter city.'
			},
			'home_loan[pincode]': {
				required: 'Please enter pincode.',
				maxlength: 'pincode must consist of at most 6 characters.'
			},
			'home_loan[residential_type]': {
				required: 'Please selecy enter residential type.'
			}
		}  	
  });

  $("#home_loan_offer").validate({
		rules: {
			"home_loan_offer[land_type]": {
				required: true
			},
			"home_loan_offer[property_type]": {
				required: true
			},
			"home_loan_offer[property_cost]": {
				required: true,
				maxlength: 10
			},
			"home_loan_offer[property_state]": {
				required: true
			},
			"home_loan_offer[property_city]": {
				required: true
			},
			"home_loan_offer[current_employment]": {
				required: true
			},
			"home_loan_offer[annual_income]": {
				required: true,
				maxlength: 10
			},
			"home_loan_offer[current_emi]": {
				required: true,
				maxlength: 10
			},
		},
		messages: {
			"home_loan_offer[land_type]": {
				required: "Please select land type."
			},
			"home_loan_offer[property_type]": {
				required: "Please select property type."
			},
			"home_loan_offer[property_cost]": {
				required: "Please enter property cost.",
				maxlength: "Property cost must consist of at most 10 characters."
			},
			"home_loan_offer[property_state]": {
				required: "Please select property state"
			},
			"home_loan_offer[property_city]": {
				required: "Please select property city."
			},
			"home_loan_offer[current_employment]": {
				required: "Please select current employment."
			},
			"home_loan_offer[annual_income]": {
				required: "Please select annual income.",
				maxlength: "Annual income must consist of at most 10 characters."
			},
			"home_loan_offer[current_emi]": {
				required: "Please select current EMI.",
				maxlength: "Current EMI must consist of at most 10 characters."
			},
		}
	});

	$("#home_loan_assets").validate({
		rules: {
			"home_loan[persoanl_bank_statement]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"home_loan[business_bank_statement]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"home_loan[id_proof]": {
				required: true,
				file_type: true,
				file_size: true				
			},
			"home_loan[salary_slip]": {
				required: true,
				file_type: true,
				file_size: true				
			},
			"home_loan[itr_copy]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"home_loan[passport_photo]": {
				required: true,
				file_type: true,
				file_size: true
			}
		},
		messages: {
			"home_loan[persoanl_bank_statement]": {
				required: 'Please select persoanl bank statement.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"home_loan[business_bank_statement]": {
				required: 'Please select business bank statement',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"home_loan[id_proof]": {
				required: 'Please select id proof',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'			
			},
			"home_loan[salary_slip]": {
				required: 'Please select salary slip',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'	
			},
			"home_loan[itr_copy]": {
				required: 'Please select itr copy',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"home_loan[passport_photo]": {
				required: 'Please select passport photo',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			}
		}
	})

});
