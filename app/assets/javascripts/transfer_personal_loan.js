$(document).ready(function(){

	$("#personal-loan-resend-otp").click(function(){
		$.ajax({
	    url: "/transfer_personal_loan/resend_otp",
	    dataType: "json",
	    data: {},
	    success: function (data) {
	    	toastr["info"]("Your OTP has been sent successfully.", "info");
	    }
		});
	});

	$("#transfer_personal_loan_state").change(function(evt) {
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
	    	$("#transfer_personal_loan_city").html(options);
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

  $("#transfer_personal_loan_employer_name").autocomplete({
    source:function(req, res) {
			$.ajax({
		    url: "/transfer_personal_loan/get_employer",
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
    	$("#transfer_personal_loan_employer_name").val(ui.item.label);
    	return false;
    },
    change: function (event, ui){
      if(!ui.item){ 
        $("#transfer_personal_loan_employer_name").val('');
      }
    }
  });


	$("#transfer_personal_loan_is_topup_amount").change(function(evt) {
		if(evt.target.value == "true") {
      $(".desired-loan").removeClass("hide-div");
		} else {
			$("#transfer_personal_loan_desired_loan_amount").val("0.00");
      $(".desired-loan").addClass("hide-div");
		}
	});


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

	jQuery.validator.addMethod("trp_is_pincode", function(value, element) {
		var status = false;
		var attr;
		if($(element).attr('id') == "transfer_personal_loan_pincode") {
			attr = "#transfer_personal_loan_city";
		} else {
			attr = "#transfer_personal_loan_office_city";
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

	$("#otp_transfer_personal_loan").validate({
		rules: {
			"transfer_personal_loan[otp]": {
				required: true,
				minlength: 6
			}
		},
		messages: {
			'transfer_personal_loan[otp]': {
				required: 'Please enter OTP.',
				minlength: 'OTP should be 6 digits only.',
			}
		}
	});

	$("#basic_transfer_personal_loan").validate({
		rules: {
			"transfer_personal_loan[mobile_number]": {
				required: true,
				minlength: 10
			},
			'transfer_personal_loan[foreclose_loan_amount]': {
				required: true,
				maxlength: 10,
				valid_loan_amt: true
			},
			'transfer_personal_loan[desired_loan_amount]': {
				required: true,
				maxlength: 10,
				valid_loan_amt: true
			},
			'transfer_personal_loan[tenure]': {
				required: true
			},
			'transfer_personal_loan[is_topup_amount]': {
        required: true
			},
			"transfer_personal_loan[terms_and_conditions]": {
				required: true
			},
			"transfer_personal_loan[city]": {
				required: true
			},
			"transfer_personal_loan[bank_name]": {
				required: true
			},
			"transfer_personal_loan[monthly_net_salary]": {
				required: true,
				maxlength: 10,
				valid_salary: true
			},
		},
		messages: {
			'transfer_personal_loan[tenure]': {
				required: 'Please select tenure.'
			},
			'transfer_personal_loan[foreclose_loan_amount]': {
				required: 'Please enter loan amount.',
				maxlength: 'Loan amount must consist of at most 10 characters',
				valid_loan_amt: "Loan amount should be greator than or equal to ₹ 50,000."
			},
			'transfer_personal_loan[desired_loan_amount]': {
				required: 'Please enter loan amount.',
				maxlength: 'Loan amount must consist of at most 10 characters',
				valid_loan_amt: "Loan amount should be greator than or equal to ₹ 50,000."
			},
			'transfer_personal_loan[mobile_number]': {
				required: 'Please enter mobile number.',
				minlength: 'Mobile number must consist of at least 10 characters'
			},
			"transfer_personal_loan[terms_and_conditions]": {
				required: "Please select terms and conditions."
			},
			'transfer_personal_loan[is_topup_amount]': {
        required: "Please select option for topup amount."
			},
			"transfer_personal_loan[monthly_net_salary]": {
				required: 'Please enter monthly net salary.',
				maxlength: 'Monthly net salary must consist of at most 10 characters.',
				valid_salary: 'Salary should be greator than or equal to ₹ 15,000.'
			},
			"transfer_personal_loan[city]": {
				required: "Please select city."
			},
			"transfer_personal_loan[bank_name]": {
				required: "Please select bank name."
			},
		}
	});

  $("#transfer_personal_loan").validate({
		rules: {
			"transfer_personal_loan[dob]": {
				required: true,
			},
			"transfer_personal_loan[employer_name]": {
				required: true
			},
			"transfer_personal_loan[current_emi]": {
				required: true
			},
			"transfer_personal_loan[existing_card]": {
				required: true
			},
			"transfer_personal_loan[full_name]": {
				required: true,
				full_name: true
			},
			"transfer_personal_loan[email]": {
				required: true,
				email: true
			},
		},
		messages: {
			'transfer_personal_loan[dob]': {
				required: 'Please enter date of birth.',
				max: "For applying loan you should be minimum 21 years old.",
				min: ""
			},
			"transfer_personal_loan[employer_name]": {
				required: "Please enter company name."
			},
			"transfer_personal_loan[current_emi]": {
				required: "Please enter your current EMI."
			},
			"transfer_personal_loan[existing_card]": {
				required: "Please select existing card option."
			},
			"transfer_personal_loan[full_name]": {
				required: "Please enter full name",
				full_name: "Please enter valid full name."
			},
			"transfer_personal_loan[email]": {
				required: "Please enter email.",
				email: "Please enter valid email."
			},
		}
  });

  $("#transfer_personal_loan_address").validate({
		rules: {
			"transfer_personal_loan[address]": {
				required: true,
				minlength: 20
			},
			"transfer_personal_loan[city]": {
				required: true,
			},
			"transfer_personal_loan[pincode]": {
				required: true,
				minlength: 6,
				trp_is_pincode: true
			},
			"transfer_personal_loan[office_address]": {
				required: true,
				minlength: 20
			},
			"transfer_personal_loan[office_city]": {
				required: true,
			},
			"transfer_personal_loan[office_pincode]": {
				required: true,
				minlength: 6,
				trp_is_pincode: true
			},
		},
		messages: {
			"transfer_personal_loan[address]": {
				required: "Please enter address.",
				minlength: "Address must consist of at least 20 characters.",
			},
			"transfer_personal_loan[city]": {
				required: "Please enter city.",
			},
			"transfer_personal_loan[pincode]": {
				required: "Please enter pincode.",
				minlength: "Pincode must consist of at least 6 characters.",
			},
			"transfer_personal_loan[office_address]": {
				required: "Please enter office address.",
				minlength: "Address must consist of at least 20 characters.",
			},
			"transfer_personal_loan[office_city]": {
				required: "Please enter office city.",
			},
			"transfer_personal_loan[office_pincode]": {
				required: "Please enter office pincode.",
				minlength: "Pincode must consist of at least 6 characters.",
			},
		}
  });

	$("#transfer_personal_loan_assets").validate({
    errorPlacement: function(error, element) {
      element.parent().parent().append(error);
    },
		rules: {
			"transfer_personal_loan[id_proof_front]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"transfer_personal_loan[id_proof_back]": {
				required: true,
				file_type: true,
				file_size: true
			},
		},
		messages: {
			'transfer_personal_loan[id_proof_front]': {
				required: 'Please select id proof front.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			'transfer_personal_loan[id_proof_back]': {
				required: 'Please select id proof back.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'				
			},
		}		
	})

});
