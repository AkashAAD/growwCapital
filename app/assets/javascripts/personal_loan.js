$(document).ready(function(){

	$("#personal_loan_state").change(function(evt) {
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
	    	$("#personal_loan_city").html(options);
	    }
		});
	});

	$("#employer_detail_office_state").change(function(evt) {
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
	    	$("#employer_detail_office_city").html(options);
	    }
		});
	});

  $("#employer_detail_employer_name").autocomplete({
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
    	$("#employer_detail_employer_name").val(ui.item.label);
    	return false;
    },
    change: function (event, ui){
      if(!ui.item){ 
        $("#employer_detail_employer_name").val('');
      }
    }
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

	jQuery.validator.addMethod("valid_salary", function(value, element) {
		return parseFloat(value) >= 15000;
	}, "");


	$("#otp_personal_loan").validate({
		rules: {
			"personal_loan[otp]": {
				required: true,
				maxlength: 6
			}
		},
		messages: {
			'personal_loan[otp]': {
				required: 'Please enter OTP.',
				required: 'OTP should be 6 digits only.',
			}
		}
	});

	$("#basic_personal_loan").validate({
		rules: {
			"personal_loan[mobile_number]": {
				required: true,
				maxlength: 10
			},
			"personal_loan[first_name]": {
				required: true,
				maxlength: 50
			},
			"personal_loan[middle_name]": {
				required: true,
				maxlength: 50
			},
			"personal_loan[last_name]": {
				required: true,
				maxlength: 50
			},
			'personal_loan[email]': {
				required: true,
				email: true
			},
			'personal_loan[loan_amount]': {
				required: true,
				maxlength: 10
			},
			'personal_loan[tenure]': {
				required: true
			},
			"personal_loan[terms_and_conditions]": {
				required: true
			}
		},
		messages: {
			'personal_loan[tenure]': {
				required: 'Please select tenure.'
			},
			'personal_loan[loan_amount]': {
				required: 'Please enter loan amount.',
				maxlength: 'Loan amount must consist of at most 10 characters'
			},
			'personal_loan[mobile_number]': {
				required: 'Please enter mobile number.',
				maxlength: 'Mobile number must consist of at most 10 characters'
			},
			'personal_loan[first_name]': {
				required: 'Please enter first name.',
				maxlength: 'First Name must consist of at most 50 characters'
			},
			'personal_loan[middle_name]': {
				required: 'Please enter middle name.',
				maxlength: 'Middle Name must consist of at most 50 characters.'
			},
			'personal_loan[last_name]': {
				required: 'Please enter last name.',
				maxlength: 'Middle Name must consist of at most 50 characters.'
			},
			'personal_loan[email]': {
				required: 'Please enter office email.',
				email: 'Email should be valid.'
			},
			"personal_loan[terms_and_conditions]": {
				required: "Please select terms and conditions."
			}
		}
	});

  $("#personal_loan").validate({
		rules: {
			"personal_loan[dob]": {
				required: true
			},
			"personal_loan[gender]": {
				required: true
			},
			"personal_loan[marital_status]": {
				required: true
			},
			"personal_loan[highest_qualification]": {
				required: true
			},
			"personal_loan[no_of_dependent]": {
				required: true
			},
			"personal_loan[current_residency_since_year]": {
				required: true
			},
			"personal_loan[current_city_since_year]": {
				required: true
			},
			"personal_loan[pan_number]": {
				required: true,
				maxlength: 10,
				is_pan: true
			},
			"personal_loan[purpose_of_loan]": {
				required: true,
				maxlength: 50
			},
			"personal_loan[residential_type]": {
				required: true
			},
			"personal_loan[address_line1]": {
				required: true,
				maxlength: 150
			},
			"personal_loan[address_line2]": {
				required: true,
				maxlength: 150
			},
			"personal_loan[landmark]": {
				required: true,
				maxlength: 50
			},
			"personal_loan[state]": {
				required: true
			},
			"personal_loan[city]": {
				required: true
			},
			"personal_loan[pincode]": {
				required: true,
				maxlength: 6
			}
		},
		messages: {
			'personal_loan[dob]': {
				required: 'Please enter date of birth.'
			},
			'personal_loan[gender]': {
				required: 'Please select gender.'
			},
			'personal_loan[marital_status]': {
				required: 'Please select marital status.'
			},
			'personal_loan[highest_qualification]': {
				required: 'Please select highest qualification.'
			},
			'personal_loan[no_of_dependent]': {
				required: 'Please select number of dependents.'
			},
			'personal_loan[current_residency_since_year]': {
				required: 'Please select stying in current residence since.'
			},
			'personal_loan[current_city_since_year]': {
				required: 'Please select stying at current city since.'
			},
			'personal_loan[pan_number]': {
				required: 'Please enter pan number.',
				maxlength: 'Pan number must consist of at most 10 characters.',
				is_pan: 'Entered pan number is invalid.'
			},
			'personal_loan[purpose_of_loan]': {
				required: 'Please select purpose of loan.'
			},
			'personal_loan[address_line1]': {
				required: 'Please enter address_line1.',
				maxlength: 'Address line1 must consist of at most 150 characters.'
			},
			'personal_loan[address_line2]': {
				required: 'Please enter address line2.',
				maxlength: 'Address line2 must consist of at most 150 characters.'
			},
			'personal_loan[landmark]': {
				required: 'Please enter landmark.',
				maxlength: 'Landmark must consist of at most 150 characters.'
			},
			'personal_loan[state]': {
				required: 'Please select enter state.'
			},
			'personal_loan[city]': {
				required: 'Please select enter city.'
			},
			'personal_loan[pincode]': {
				required: 'Please enter pincode.',
				maxlength: 'pincode must consist of at most 6 characters.'
			},
			'personal_loan[residential_type]': {
				required: 'Please selecy enter residential type.'
			}
		}  	
  });

  $("#employer_detail").validate({
		rules: {
			"employer_detail[employer_name]": {
				required: true,
				maxlength: 50
			},
			"employer_detail[designation]": {
				required: true,
				maxlength: 50
			},
			"employer_detail[years_in_current_job]": {
				required: true,
				maxlength: 50
			},
			"employer_detail[office_address_line1]": {
				required: true,
				maxlength: 150
			},
			"employer_detail[office_address_line2]": {
				required: true,
				maxlength: 150
			},
			"employer_detail[mailing_address]": {
				required: true
			},
			"employer_detail[first_name]": {
				required: true,
				maxlength: 50
			},
			"employer_detail[last_name]": {
				required: true,
				maxlength: 50
			},
			"employer_detail[mobile_number]": {
				required: true,
				maxlength: 10
			},
			"employer_detail[ref_mobile_number]": {
				required: true,
				maxlength: 10
			},
			"employer_detail[salary_bank_account_name]": {
				required: true
			},
			"employer_detail[branch_name]": {
				required: true,
				maxlength: 50
			},
			"employer_detail[branch_name]": {
				required: true,
				maxlength: 50
			},
			"employer_detail[monthly_net_salary]": {
				required: true,
				maxlength: 10,
				valid_salary: true
			},
			"employer_detail[current_emi]": {
				required: true,
				maxlength: 10
			},
			"employer_detail[landmark]": {
				required: true,
				maxlength: 50
			},
			"employer_detail[office_state]": {
				required: true
			},
			"employer_detail[office_city]": {
				required: true
			},
			"employer_detail[office_pincode]": {
				required: true,
				maxlength: 6
			},
		},
		messages: {
			'employer_detail[employer_name]': {
				required: 'Please enter employer name.',
				maxlength: 'Employer name must consist of at most 50 characters.'
			},
			'employer_detail[first_name]': {
				required: 'Please enter first name.',
				maxlength: 'First name must consist of at most 50 characters'
			},
			'employer_detail[last_name]': {
				required: 'Please enter last name.',
				maxlength: 'Last name must consist of at most 50 characters.'
			},
			'employer_detail[designation]': {
				required: 'Please enter designation.',
				maxlength: 'Designation must consist of at most 50 characters.'
			},
			'employer_detail[years_in_current_job]': {
				required: 'Please select years in current job.'
			},
			'employer_detail[office_address_line1]': {
				required: 'Please enter address_line1.',
				maxlength: 'Address line1 must consist of at most 150 characters.'
			},
			'employer_detail[office_address_line2]': {
				required: 'Please enter address line2.',
				maxlength: 'Address line2 must consist of at most 150 characters.'
			},
			'employer_detail[landmark]': {
				required: 'Please enter landmark.',
				maxlength: 'Landmark must consist of at most 150 characters.'
			},
			'employer_detail[office_state]': {
				required: 'Please select enter state.'
			},
			'employer_detail[office_city]': {
				required: 'Please select enter city.'
			},
			'employer_detail[office_pincode]': {
				required: 'Please enter pincode.',
				maxlength: 'pincode must consist of at most 6 characters.'
			},
			'employer_detail[mailing_address]': {
				required: 'Please selecy enter mailing address.'
			},
			'employer_detail[mobile_number]': {
				required: 'Please enter mobile number.',
				maxlength: 'Mobile number must consist of at most 150 characters.'
			},
			'employer_detail[ref_mobile_number]': {
				required: 'Please enter reference mobile number.',
				maxlength: 'Reference mobile number must consist of at most 150 characters.'
			},
			'employer_detail[salary_bank_account_name]': {
				required: 'Please enter salary bank account name.'
			},
			'employer_detail[branch_name]': {
				required: 'Please enter branch name.',
				maxlength: 'Branch name must consist of at most 150 characters.'
			},
			'employer_detail[monthly_net_salary]': {
				required: 'Please enter monthly net salary.',
				maxlength: 'Monthly net salary must consist of at most 10 characters.',
				valid_salary: 'Salary should be greator than or equal to ₹ 15,000.'
			},
			'employer_detail[current_emi]': {
				required: 'Please enter current emi.',
				maxlength: 'Current EMI must consist of at most 150 characters.'
			}
		}
  });

	$("#personal_loan_assets").validate({
		rules: {
			"personal_loan[id_proof]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"personal_loan[address_proof]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"personal_loan[bank_statement]": {
				required: true,
				file_type: true,
				file_size: true				
			},
			"personal_loan[salary_slip]": {
				required: true,
				file_type: true,
				file_size: true				
			},
			"personal_loan[passport_photo]": {
				required: true,
				file_type: true,
				file_size: true				
			}
		},
		messages: {
			'personal_loan[id_proof]': {
				required: 'Please select id proof.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 5 mb.'
			},
			'personal_loan[address_proof]': {
				required: 'Please select address proof.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 5 mb.'				
			},
			'personal_loan[bank_statement]': {
				required: 'Please select bank statement.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 5 mb.'				
			},
			'personal_loan[salary_slip]': {
				required: 'Please select salary slip.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 5 mb.'				
			},
			'personal_loan[passport_photo]': {
				required: 'Please select passport photo.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 5 mb.'				
			}												
		}		
	})

});
