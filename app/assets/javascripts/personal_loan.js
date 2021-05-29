$(document).ready(function(){

	$("#personal-loan-resend-otp").click(function(){
		$.ajax({
	    url: "/personal_loan/resend_otp",
	    dataType: "json",
	    data: {},
	    success: function (data) {
	    	toastr["info"]("Your OTP has been sent successfully.", "info");
	    }
		});
	});

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

  $("#personal_loan_employer_name").autocomplete({
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
    	$("#personal_loan_employer_name").val(ui.item.label);
    	return false;
    },
    change: function (event, ui){
      if(!ui.item){ 
        $("#personal_loan_employer_name").val('');
      }
    }
  });

	jQuery.validator.addMethod("per_is_pincode", function(value, element) {
		var status = false;
		var attr;
		if($(element).attr('id') == "personal_loan_pincode") {
			attr = "#personal_loan_city";
		} else {
			attr = "#personal_loan_office_city";
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

	jQuery.validator.addMethod("is_pan", function(value, element) {
	  return this.optional(element) || /^[A-Z]{5}[0-9]{4}[A-Z]{1}$/.test(value);
	}, "Entered pan number is invalid.");

	jQuery.validator.addMethod("full_name", function(value, element) {
	  return value.split(" ").length >= 2;
	}, "");

	jQuery.validator.addMethod("email", function(value, element) {
	  return this.optional(element) || /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(value);
	}, "");

	jQuery.validator.addMethod("valid_loan_amt", function(value, element) {
		return parseFloat(value) >= 50000;
	}, "");

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

	$("#otp_personal_loan").validate({
		rules: {
			"personal_loan[otp]": {
				required: true,
				minlength: 6
			}
		},
		messages: {
			'personal_loan[otp]': {
				required: 'Please enter OTP.',
				minlength: 'OTP should be 6 digits only.',
			}
		}
	});

	$("#basic_personal_loan").validate({
		rules: {
			"personal_loan[mobile_number]": {
				required: true,
				minlength: 10
			},
			'personal_loan[loan_amount]': {
				required: true,
				maxlength: 10,
				valid_loan_amt: true
			},
			'personal_loan[tenure]': {
				required: true
			},
			"personal_loan[terms_and_conditions]": {
				required: true
			},
			"personal_loan[city]": {
				required: true
			},
			"personal_loan[personal_loan_bank_id]": {
				required: true
			},
			"personal_loan[monthly_net_salary]": {
				required: true,
				maxlength: 10,
				valid_salary: true
			},
		},
		messages: {
			'personal_loan[tenure]': {
				required: 'Please select tenure.'
			},
			'personal_loan[loan_amount]': {
				required: 'Please enter loan amount.',
				maxlength: 'Loan amount must consist of at most 10 characters',
				valid_loan_amt: "Loan amount should be greator than or equal to ₹ 50,000."
			},
			'personal_loan[mobile_number]': {
				required: 'Please enter mobile number.',
				minlength: 'Mobile number must consist of at least 10 characters'
			},
			"personal_loan[terms_and_conditions]": {
				required: "Please select terms and conditions."
			},
			"personal_loan[monthly_net_salary]": {
				required: 'Please enter monthly net salary.',
				maxlength: 'Monthly net salary must consist of at most 10 characters.',
				valid_salary: 'Salary should be greator than or equal to ₹ 15,000.'
			},
			"personal_loan[city]": {
				required: "Please select city."
			},
			"personal_loan[personal_loan_bank_id]": {
				required: "Please select bank name."
			},
		}
	});

  $("#personal_loan").validate({
		rules: {
			"personal_loan[dob]": {
				required: true,
			},
			"personal_loan[employer_name]": {
				required: true
			},
			"personal_loan[existing_card]": {
				required: true
			},
			"personal_loan[full_name]": {
				required: true,
				full_name: true
			},
			"personal_loan[email]": {
				required: true,
				email: true
			},
		},
		messages: {
			'personal_loan[dob]': {
				required: 'Please enter date of birth.',
				max: "For applying loan you should be minimum 21 years old.",
				min: "For applying loan you should be maximum 60 years old."
			},
			"personal_loan[employer_name]": {
				required: "Please enter company name."
			},
			"personal_loan[existing_card]": {
				required: "Please select existing card option."
			},
			"personal_loan[full_name]": {
				required: "Please enter full name",
				full_name: "Please enter valid full name."
			},
			"personal_loan[email]": {
				required: "Please enter email.",
				email: "Please enter valid email."
			},
		}
  });

  $("#personal_loan_address").validate({
		rules: {
			"personal_loan[address]": {
				required: true,
				minlength: 20
			},
			"personal_loan[city]": {
				required: true,
			},
			"personal_loan[pincode]": {
				required: true,
				minlength: 6,
				per_is_pincode: true
			},
			"personal_loan[office_address]": {
				required: true,
				minlength: 20
			},
			"personal_loan[office_city]": {
				required: true,
			},
			"personal_loan[office_pincode]": {
				required: true,
				minlength: 6,
				per_is_pincode: true
			},
		},
		messages: {
			"personal_loan[address]": {
				required: "Please enter address.",
				minlength: "Address must consist of at least 20 characters.",
			},
			"personal_loan[city]": {
				required: "Please enter city.",
			},
			"personal_loan[pincode]": {
				required: "Please enter pincode.",
				minlength: "Pincode must consist of at least 6 characters.",
			},
			"personal_loan[office_address]": {
				required: "Please enter office address.",
				minlength: "Address must consist of at least 20 characters.",
			},
			"personal_loan[office_city]": {
				required: "Please enter office city.",
			},
			"personal_loan[office_pincode]": {
				required: "Please enter office pincode.",
				minlength: "Pincode must consist of at least 6 characters.",
			},
		}
  });

	$("#personal_loan_assets").validate({
    errorPlacement: function(error, element) {
      element.parent().parent().append(error);
    },
		rules: {
			"personal_loan[id_proof_front]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"personal_loan[id_proof_back]": {
				required: true,
				file_type: true,
				file_size: true
			},
		},
		messages: {
			'personal_loan[id_proof_front]': {
				required: 'Please select id proof front.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			'personal_loan[id_proof_back]': {
				required: 'Please select id proof back.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'				
			},
		}		
	})

});
