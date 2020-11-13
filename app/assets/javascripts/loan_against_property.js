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
				maxlength: 6
			}
		},
		messages: {
			'loan_against_property[otp]': {
				required: 'Please enter OTP.',
				required: 'OTP should be 6 digits only.',
			}
		}
	});

	$("#basic_loan_against_property").validate({
		rules: {
			"loan_against_property[mobile_number]": {
				required: true,
				minlength: 10
			},
			"loan_against_property[first_name]": {
				required: true,
				maxlength: 50
			},
			"loan_against_property[middle_name]": {
				required: true,
				maxlength: 50
			},
			"loan_against_property[last_name]": {
				required: true,
				maxlength: 50
			},
			'loan_against_property[email]': {
				required: true,
				email: true
			},
			'loan_against_property[loan_amount]': {
				required: true,
				maxlength: 10
			},
			'loan_against_property[tenure]': {
				required: true
			},
			"loan_against_property[terms_and_conditions]": {
				required: true
			}
		},
		messages: {
			'loan_against_property[tenure]': {
				required: 'Please select tenure.'
			},
			'loan_against_property[loan_amount]': {
				required: 'Please enter loan amount.',
				maxlength: 'Loan amount must consist of at most 10 characters'
			},
			'loan_against_property[mobile_number]': {
				required: 'Please enter mobile number.',
				minlength: 'Mobile number must consist of at least 10 characters'
			},
			'loan_against_property[first_name]': {
				required: 'Please enter first name.',
				maxlength: 'First Name must consist of at most 50 characters'
			},
			'loan_against_property[middle_name]': {
				required: 'Please enter middle name.',
				maxlength: 'Middle Name must consist of at most 50 characters.'
			},
			'loan_against_property[last_name]': {
				required: 'Please enter last name.',
				maxlength: 'Middle Name must consist of at most 50 characters.'
			},
			'loan_against_property[email]': {
				required: 'Please enter office email.',
				email: 'Email should be valid.'
			},
			"loan_against_property[terms_and_conditions]": {
				required: "Please select terms and conditions."
			}
		}
	});

  $("#loan_against_property").validate({
		rules: {
			"loan_against_property[dob]": {
				required: true
			},
			"loan_against_property[gender]": {
				required: true
			},
			"loan_against_property[marital_status]": {
				required: true
			},
			"loan_against_property[highest_qualification]": {
				required: true
			},
			"loan_against_property[no_of_dependent]": {
				required: true
			},
			"loan_against_property[current_residency_since_year]": {
				required: true
			},
			"loan_against_property[current_city_since_year]": {
				required: true
			},
			"loan_against_property[pan_number]": {
				required: true,
				maxlength: 10,
				is_pan: true
			},
			"loan_against_property[purpose_of_loan]": {
				required: true,
				maxlength: 50
			},
			"loan_against_property[residential_type]": {
				required: true
			},
			"loan_against_property[address_line1]": {
				required: true,
				maxlength: 150
			},
			"loan_against_property[address_line2]": {
				required: true,
				maxlength: 150
			},
			"loan_against_property[landmark]": {
				required: true,
				maxlength: 50
			},
			"loan_against_property[state]": {
				required: true
			},
			"loan_against_property[city]": {
				required: true
			},
			"loan_against_property[pincode]": {
				required: true,
				maxlength: 6
			}
		},
		messages: {
			'loan_against_property[dob]': {
				required: 'Please enter date of birth.'
			},
			'loan_against_property[gender]': {
				required: 'Please select gender.'
			},
			'loan_against_property[marital_status]': {
				required: 'Please select marital status.'
			},
			'loan_against_property[highest_qualification]': {
				required: 'Please select highest qualification.'
			},
			'loan_against_property[no_of_dependent]': {
				required: 'Please select number of dependents.'
			},
			'loan_against_property[current_residency_since_year]': {
				required: 'Please select stying in current residence since.'
			},
			'loan_against_property[current_city_since_year]': {
				required: 'Please select stying at current city since.'
			},
			'loan_against_property[pan_number]': {
				required: 'Please enter pan number.',
				maxlength: 'Pan number must consist of at most 10 characters.',
				is_pan: 'Entered pan number is invalid.'
			},
			'loan_against_property[purpose_of_loan]': {
				required: 'Please select purpose of loan.'
			},
			'loan_against_property[address_line1]': {
				required: 'Please enter address_line1.',
				maxlength: 'Address line1 must consist of at most 150 characters.'
			},
			'loan_against_property[address_line2]': {
				required: 'Please enter address line2.',
				maxlength: 'Address line2 must consist of at most 150 characters.'
			},
			'loan_against_property[landmark]': {
				required: 'Please enter landmark.',
				maxlength: 'Landmark must consist of at most 150 characters.'
			},
			'loan_against_property[state]': {
				required: 'Please select enter state.'
			},
			'loan_against_property[city]': {
				required: 'Please select enter city.'
			},
			'loan_against_property[pincode]': {
				required: 'Please enter pincode.',
				maxlength: 'pincode must consist of at most 6 characters.'
			},
			'loan_against_property[residential_type]': {
				required: 'Please selecy enter residential type.'
			}
		}  	
  });

  $("#loan_against_property_offer").validate({
		rules: {
			"loan_against_property_offer[employment_type]": {
				required: true
			},
			"loan_against_property_offer[annual_income]": {
				required: true,
				maxlength: 10
			},
			"loan_against_property_offer[property_cost]": {
				required: true,
				maxlength: 10				
			},
			"loan_against_property_offer[land_type]": {
				required: true
			},
			"loan_against_property_offer[property_type]": {
				required: true
			},
			"loan_against_property_offer[buildup_area]": {
				required: true
			},
			"loan_against_property_offer[property_state]": {
				required: true
			},
			"loan_against_property_offer[property_city]": {
				required: true
			},
			"loan_against_property_offer[current_emi]": {
				required: true,
				maxlength: 10
			},
		},
		messages: {
			"loan_against_property_offer[employment_type]": {
				required: "Please select employment type."
			},
			"loan_against_property_offer[annual_income]": {
				required: "Please enter annual income.",
				maxlength: 'Annual income must consist of at most 10 characters.'
			},
			"loan_against_property_offer[property_cost]": {
				required: "Please select property cost.",
				maxlength: 'Property cost must consist of at most 10 characters.'
			},
			"loan_against_property_offer[land_type]": {
				required: "Please select land type."
			},
			"loan_against_property_offer[property_type]": {
				required: "Please select property type."
			},
			"loan_against_property_offer[buildup_area]": {
				required: "Please enter buildup area."
			},
			"loan_against_property_offer[property_state]": {
				required: "Please select property state."
			},
			"loan_against_property_offer[property_city]": {
				required: "Please select property city."
			},
			"loan_against_property_offer[current_emi]": {
				required: "Please enter current EMI.",
				maxlength: 'Current EMI must consist of at most 10 characters.'
			},
		}
	});

	$("#loan_against_property_assets").validate({
		rules: {
			"loan_against_property[persoanl_bank_statement]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"loan_against_property[property_photo]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"loan_against_property[id_proof]": {
				required: true,
				file_type: true,
				file_size: true				
			},
			"loan_against_property[salary_slip]": {
				required: true,
				file_type: true,
				file_size: true				
			},
			"loan_against_property[itr_copy]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"loan_against_property[passport_photo]": {
				required: true,
				file_type: true,
				file_size: true
			}
		},
		messages: {
			"loan_against_property[persoanl_bank_statement]": {
				required: 'Please select persoanl bank statement.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"loan_against_property[property_photo]": {
				required: 'Please select property photo',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"loan_against_property[id_proof]": {
				required: 'Please select id proof',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'			
			},
			"loan_against_property[salary_slip]": {
				required: 'Please select salary slip',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'	
			},
			"loan_against_property[itr_copy]": {
				required: 'Please select itr copy',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"loan_against_property[passport_photo]": {
				required: 'Please select passport photo',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			}
		}
	})

});
