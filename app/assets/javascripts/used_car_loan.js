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

	$("#used_car_loan_state").change(function(evt) {
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
	    	$("#used_car_loan_city").html(options);
	    }
		});
	});

	$("#used_car_loan_offer_office_state").change(function(evt) {
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
	    	$("#used_car_loan_offer_office_city").html(options);
	    }
		});
	});

	$("#used_car_loan_offer_office_state").change(function(evt) {
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
	    	$("#used_car_loan_offer_office_city").html(options);
	    }
		});
	});

	$("#used_car_loan_offer_state").change(function(evt) {
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
	    	$("#used_car_loan_offer_city").html(options);
	    }
		});
	});

	$("#used_car_loan_offer_profession_status").change(function(evt) {
		if(evt.target.value == "salaried") {
			$(".used-car-other-info").addClass("used-car-show-div");
			$(".used-car-salaried").addClass("used-car-show-div");
			$(".used-car-self-employed").removeClass("used-car-show-div");
		} else if(evt.target.value == "self-employed") {
			$(".used-car-other-info").addClass("used-car-show-div");
			$(".used-car-salaried").removeClass("used-car-show-div");
			$(".used-car-self-employed").addClass("used-car-show-div");
		} else {
			$(".used-car-other-info").removeClass("used-car-show-div");
			$(".used-car-salaried").removeClass("used-car-show-div");
			$(".used-car-self-employed").removeClass("used-car-show-div");
		}
	});

  $("#used_car_loan_offer_employer_name").autocomplete({
    source:function(req, res) {
			$.ajax({
		    url: "/personal_loan/get_employer",
		    dataType: "json",
		    data: {
		      term: req.term
		    },
		    success: function (data) {
	        res($.map(data.employers, function (item) {
            return {
                label: item.name,
                value: item.id
            };
	        }));
		    }
			});
    },
    minLength: 1,
    select: function( event, ui ) {
    	$("#used_car_loan_offer_employer_name").val(ui.item.label);
    	return false;
    },
    change: function (event, ui){
      if(!ui.item){ 
        $("#used_car_loan_offer_employer_name").val('');
      }
    }
  });

	$("#used_car_loan_offer_registration_state").change(function(evt) {
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
	    	$("#used_car_loan_offer_registration_city").html(options);
	    }
		});
	});



	$("#otp_used_car_loan").validate({
		rules: {
			"used_car_loan[otp]": {
				required: true,
				maxlength: 6
			}
		},
		messages: {
			'used_car_loan[otp]': {
				required: 'Please enter OTP.',
				required: 'OTP should be 6 digits only.',
			}
		}
	});

	$("#basic_used_car_loan").validate({
		rules: {
			"used_car_loan[mobile_number]": {
				required: true,
				maxlength: 10
			},
			"used_car_loan[first_name]": {
				required: true,
				maxlength: 50
			},
			"used_car_loan[middle_name]": {
				required: true,
				maxlength: 50
			},
			"used_car_loan[last_name]": {
				required: true,
				maxlength: 50
			},
			'used_car_loan[email]': {
				required: true,
				email: true
			},
			'used_car_loan[loan_amount]': {
				required: true,
				maxlength: 10
			},
			'used_car_loan[tenure]': {
				required: true
			},
			"used_car_loan[terms_and_conditions]": {
				required: true
			}
		},
		messages: {
			'used_car_loan[tenure]': {
				required: 'Please select tenure.'
			},
			'used_car_loan[loan_amount]': {
				required: 'Please enter loan amount.',
				maxlength: 'Loan amount must consist of at most 10 characters'
			},
			'used_car_loan[mobile_number]': {
				required: 'Please enter mobile number.',
				maxlength: 'Mobile number must consist of at most 10 characters'
			},
			'used_car_loan[first_name]': {
				required: 'Please enter first name.',
				maxlength: 'First Name must consist of at most 50 characters'
			},
			'used_car_loan[middle_name]': {
				required: 'Please enter middle name.',
				maxlength: 'Middle Name must consist of at most 50 characters.'
			},
			'used_car_loan[last_name]': {
				required: 'Please enter last name.',
				maxlength: 'Middle Name must consist of at most 50 characters.'
			},
			'used_car_loan[email]': {
				required: 'Please enter office email.',
				email: 'Email should be valid.'
			},
			"used_car_loan[terms_and_conditions]": {
				required: "Please select terms and conditions."
			}
		}
	});

  $("#used_car_loan").validate({
		rules: {
			"used_car_loan[dob]": {
				required: true
			},
			"used_car_loan[gender]": {
				required: true
			},
			"used_car_loan[marital_status]": {
				required: true
			},
			"used_car_loan[highest_qualification]": {
				required: true
			},
			"used_car_loan[no_of_dependent]": {
				required: true
			},
			"used_car_loan[current_residency_since_year]": {
				required: true
			},
			"used_car_loan[current_city_since_year]": {
				required: true
			},
			"used_car_loan[pan_number]": {
				required: true,
				maxlength: 10,
				is_pan: true
			},
			"used_car_loan[purpose_of_loan]": {
				required: true,
				maxlength: 50
			},
			"used_car_loan[residential_type]": {
				required: true
			},
			"used_car_loan[address_line1]": {
				required: true,
				maxlength: 150
			},
			"used_car_loan[address_line2]": {
				required: true,
				maxlength: 150
			},
			"used_car_loan[landmark]": {
				required: true,
				maxlength: 50
			},
			"used_car_loan[state]": {
				required: true
			},
			"used_car_loan[city]": {
				required: true
			},
			"used_car_loan[pincode]": {
				required: true,
				maxlength: 6
			}
		},
		messages: {
			'used_car_loan[dob]': {
				required: 'Please enter date of birth.'
			},
			'used_car_loan[gender]': {
				required: 'Please select gender.'
			},
			'used_car_loan[marital_status]': {
				required: 'Please select marital status.'
			},
			'used_car_loan[highest_qualification]': {
				required: 'Please select highest qualification.'
			},
			'used_car_loan[no_of_dependent]': {
				required: 'Please select number of dependents.'
			},
			'used_car_loan[current_residency_since_year]': {
				required: 'Please select stying in current residence since.'
			},
			'used_car_loan[current_city_since_year]': {
				required: 'Please select stying at current city since.'
			},
			'used_car_loan[pan_number]': {
				required: 'Please enter pan number.',
				maxlength: 'Pan number must consist of at most 10 characters.',
				is_pan: 'Entered pan number is invalid.'
			},
			'used_car_loan[purpose_of_loan]': {
				required: 'Please select purpose of loan.'
			},
			'used_car_loan[address_line1]': {
				required: 'Please enter address_line1.',
				maxlength: 'Address line1 must consist of at most 150 characters.'
			},
			'used_car_loan[address_line2]': {
				required: 'Please enter address line2.',
				maxlength: 'Address line2 must consist of at most 150 characters.'
			},
			'used_car_loan[landmark]': {
				required: 'Please enter landmark.',
				maxlength: 'Landmark must consist of at most 150 characters.'
			},
			'used_car_loan[state]': {
				required: 'Please select enter state.'
			},
			'used_car_loan[city]': {
				required: 'Please select enter city.'
			},
			'used_car_loan[pincode]': {
				required: 'Please enter pincode.',
				maxlength: 'pincode must consist of at most 6 characters.'
			},
			'used_car_loan[residential_type]': {
				required: 'Please selecy enter residential type.'
			}
		}  	
  });

  $("#used_car_loan_offer").validate({
		rules: {
			"used_car_loan_offer[car_model]": {
				required: true
			},
			"used_car_loan_offer[car_manufacturer]": {
				required: true
			},
			"used_car_loan_offer[model_year]": {
				required: true
			},
			"used_car_loan_offer[car_registration_number]": {
				required: true
			},
			"used_car_loan_offer[current_emi]": {
				required: true,
				maxlength: 10
			},
			"used_car_loan_offer[registration_state]": {
				required: true
			},
			"used_car_loan_offer[registration_city]": {
				required: true
			},
			"used_car_loan_offer[profession_status]": {
				required: true
			},
			"used_car_loan_offer[employer_name]": {
				required: true,
				maxlength: 50
			},
			"used_car_loan_offer[designation]": {
				required: true,
				maxlength: 50
			},
			"used_car_loan_offer[years_in_current_job]": {
				required: true,
				maxlength: 50
			},
			"used_car_loan_offer[office_address_line1]": {
				required: true,
				maxlength: 150
			},
			"used_car_loan_offer[office_address_line2]": {
				required: true,
				maxlength: 150
			},
			"used_car_loan_offer[mailing_address]": {
				required: true
			},
			"used_car_loan_offer[first_name]": {
				required: true,
				maxlength: 50
			},
			"used_car_loan_offer[last_name]": {
				required: true,
				maxlength: 50
			},
			"used_car_loan_offer[mobile_number]": {
				required: true,
				maxlength: 10
			},
			"used_car_loan_offer[ref_mobile_number]": {
				required: true,
				maxlength: 10
			},
			"used_car_loan_offer[salary_bank_account_name]": {
				required: true
			},
			"used_car_loan_offer[branch_name]": {
				required: true,
				maxlength: 50
			},
			"used_car_loan_offer[branch_name]": {
				required: true,
				maxlength: 50
			},
			"used_car_loan_offer[monthly_net_salary]": {
				required: true,
				maxlength: 10,
				valid_salary: true
			},
			"used_car_loan_offer[landmark]": {
				required: true,
				maxlength: 50
			},
			"used_car_loan_offer[office_state]": {
				required: true
			},
			"used_car_loan_offer[office_city]": {
				required: true
			},
			"used_car_loan_offer[office_pincode]": {
				required: true,
				maxlength: 6
			},
			"used_car_loan_offer[business_name]": {
				required: true,
				maxlength: 50
			},
			"used_car_loan_offer[business_nature]": {
				required: true
			},
			"used_car_loan_offer[residence_type]": {
				required: true
			},
			"used_car_loan_offer[industry_type]": {
				required: true
			},
			"used_car_loan_offer[business_years]": {
				required: true
			},
			"used_car_loan_offer[annual_turnover]": {
				required: true,
				maxlength: 10
			},
			"used_car_loan_offer[gross_annual_profit]": {
				required: true,
				maxlength: 10
			},
			"used_car_loan_offer[address_line1]": {
				required: true,
				maxlength: 150
			},
			"used_car_loan_offer[address_line2]": {
				required: true,
				maxlength: 150
			},
			"used_car_loan_offer[bus_landmark]": {
				required: true,
				maxlength: 50
			},
			"used_car_loan_offer[state]": {
				required: true
			},
			"used_car_loan_offer[city]": {
				required: true
			},
			"used_car_loan_offer[pincode]": {
				required: true,
				maxlength: 6
			}
		},
		messages: {
			"used_car_loan_offer[car_model]": {
				required: "Please enter car model."
			},
			"used_car_loan_offer[car_manufacturer]": {
				required: "Please enter car manufacturer."
			},
			"used_car_loan_offer[model_year]": {
				required: "Please enter model year."
			},
			"used_car_loan_offer[car_registration_number]": {
				required: "Please enter car registration number."
			},
			"used_car_loan_offer[current_emi]": {
				required: "Please enter current EMI.",
				maxlength: "Current EMI must consist of at most 10 characters."
			},
			"used_car_loan_offer[registration_state]": {
				required: "Please select registration state."
			},
			"used_car_loan_offer[registration_city]": {
				required: "Please select registration city."
			},
			"used_car_loan_offer[profession_status]": {
				required: "Please select profession status."
			},
			"used_car_loan_offer[employer_name]": {
				required: "Please enter employer name."
			},
			'used_car_loan_offer[employer_name]': {
				required: 'Please enter employer name.',
				maxlength: 'Employer name must consist of at most 50 characters.'
			},
			'used_car_loan_offer[first_name]': {
				required: 'Please enter first name.',
				maxlength: 'First name must consist of at most 50 characters'
			},
			'used_car_loan_offer[last_name]': {
				required: 'Please enter last name.',
				maxlength: 'Last name must consist of at most 50 characters.'
			},
			'used_car_loan_offer[designation]': {
				required: 'Please enter designation.',
				maxlength: 'Designation must consist of at most 50 characters.'
			},
			'used_car_loan_offer[years_in_current_job]': {
				required: 'Please select years in current job.'
			},
			'used_car_loan_offer[office_address_line1]': {
				required: 'Please enter address_line1.',
				maxlength: 'Address line1 must consist of at most 150 characters.'
			},
			'used_car_loan_offer[office_address_line2]': {
				required: 'Please enter address line2.',
				maxlength: 'Address line2 must consist of at most 150 characters.'
			},
			'used_car_loan_offer[landmark]': {
				required: 'Please enter landmark.',
				maxlength: 'Landmark must consist of at most 150 characters.'
			},
			'used_car_loan_offer[office_state]': {
				required: 'Please select enter state.'
			},
			'used_car_loan_offer[office_city]': {
				required: 'Please select enter city.'
			},
			'used_car_loan_offer[office_pincode]': {
				required: 'Please enter pincode.',
				maxlength: 'pincode must consist of at most 6 characters.'
			},
			'used_car_loan_offer[mailing_address]': {
				required: 'Please selecy enter mailing address.'
			},
			'used_car_loan_offer[mobile_number]': {
				required: 'Please enter mobile number.',
				maxlength: 'Mobile number must consist of at most 150 characters.'
			},
			'used_car_loan_offer[ref_mobile_number]': {
				required: 'Please enter reference mobile number.',
				maxlength: 'Reference mobile number must consist of at most 150 characters.'
			},
			'used_car_loan_offer[salary_bank_account_name]': {
				required: 'Please enter salary bank account name.'
			},
			'used_car_loan_offer[branch_name]': {
				required: 'Please enter branch name.',
				maxlength: 'Branch name must consist of at most 150 characters.'
			},
			'used_car_loan_offer[monthly_net_salary]': {
				required: 'Please enter monthly net salary.',
				maxlength: 'Monthly net salary must consist of at most 10 characters.',
				valid_salary: 'Salary should be greator than or equal to ₹ 15,000.'
			},
			"used_car_loan_offer[business_name]": {
				required: 'Please enter business name.',
				maxlength: 'Business name must consist of at most 50 characters'
			},
			"used_car_loan_offer[business_nature]": {
				required: 'Please select business nature.'
			},
			"used_car_loan_offer[residence_type]": {
				required: 'Please select business property type.'
			},
			"used_car_loan_offer[industry_type]": {
				required: 'Please select business industry type.'
			},
			"used_car_loan_offer[business_years]": {
				required: 'Please select business business years.'
			},
			"used_car_loan_offer[annual_turnover]": {
				required: 'Please enter annual turnover.',
				maxlength: 'Annual turnover must consist of at most 10 characters'
			},
			"used_car_loan_offer[gross_annual_profit]": {
				required: 'Please enter gross annual profit.',
				maxlength: 'gross annual profit must consist of at most 10 characters'
			},
			'used_car_loan_offer[address_line1]': {
				required: 'Please enter address_line1.',
				maxlength: 'Address line1 must consist of at most 150 characters.'
			},
			'used_car_loan_offer[address_line2]': {
				required: 'Please enter address line2.',
				maxlength: 'Address line2 must consist of at most 150 characters.'
			},
			'used_car_loan_offer[bus_landmark]': {
				required: 'Please enter landmark.',
				maxlength: 'Landmark must consist of at most 150 characters.'
			},
			'used_car_loan_offer[state]': {
				required: 'Please select enter state.'
			},
			'used_car_loan_offer[city]': {
				required: 'Please select enter city.'
			},
			'used_car_loan_offer[pincode]': {
				required: 'Please enter pincode.',
				maxlength: 'pincode must consist of at most 6 characters.'
			},
		}
	});

	$("#used_car_loan_assets").validate({
		rules: {
			"used_car_loan[persoanl_bank_statement]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"used_car_loan[car_registraion_certificate]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"used_car_loan[car_photo]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"used_car_loan[business_bank_statement]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"used_car_loan[id_proof]": {
				required: true,
				file_type: true,
				file_size: true				
			},
			"used_car_loan[salary_slip]": {
				required: true,
				file_type: true,
				file_size: true				
			},
			"used_car_loan[itr_copy]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"used_car_loan[passport_photo]": {
				required: true,
				file_type: true,
				file_size: true
			}
		},
		messages: {
			"used_car_loan[persoanl_bank_statement]": {
				required: 'Please select persoanl bank statement.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"used_car_loan[car_registraion_certificate]": {
				required: 'Please select car registraion certificate',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"used_car_loan[car_photo]": {
				required: 'Please select car photo',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"used_car_loan[business_bank_statement]": {
				required: 'Please select business bank statement',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"used_car_loan[id_proof]": {
				required: 'Please select id proof',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'			
			},
			"used_car_loan[salary_slip]": {
				required: 'Please select salary slip',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'	
			},
			"used_car_loan[itr_copy]": {
				required: 'Please select itr copy',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"used_car_loan[passport_photo]": {
				required: 'Please select passport photo',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			}
		}
	})

});
