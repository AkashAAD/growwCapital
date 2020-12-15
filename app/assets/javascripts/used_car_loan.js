$(document).ready(function(){

	$("#used-car-loan-resend-otp").click(function(){
		$.ajax({
	    url: "/used_car_loan/resend_otp",
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

	jQuery.validator.addMethod("valid_salary", function(value, element) {
		return parseFloat(value) >= 15000;
	}, "");

	jQuery.validator.addMethod("full_name", function(value, element) {
	  return value.split(" ").length >= 2;
	}, "");

	jQuery.validator.addMethod("email", function(value, element) {
	  return this.optional(element) || /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(value);
	}, "");

	jQuery.validator.addMethod("valid_loan_amt", function(value, element) {
		return parseFloat(value) >= 50000;
	}, "");	

	jQuery.validator.addMethod("ucr_is_pincode", function(value, element) {
		var status = false;
		var attr;
		if($(element).attr('id') == "used_car_loan_pincode") {
			attr = "#used_car_loan_city";
		} else {
			attr = "#used_car_loan_office_city";
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

	$("#used_car_loan_car_manufacturer").change(function(evt) {
		$.ajax({
	    url: "/home/car_models",
	    dataType: "json",
	    data: {
	      id: evt.target.value
	    },
	    success: function (data) {
	    	var options = '';
	    	data.car_models.forEach(function(val) {
	    		options+= '<option value="' + val.id + '">'+ val.name +'</option>' 
	    	});
	    	$("#used_car_loan_car_model").html(options);
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
				minlength: 6
			}
		},
		messages: {
			'used_car_loan[otp]': {
				required: 'Please enter OTP.',
				minlength: 'OTP should be 6 digits only.',
			}
		}
	});

	$("#basic_used_car_loan").validate({
		rules: {
			"used_car_loan[employment_type]": {
				required: true
			},
			'used_car_loan[loan_amount]': {
				required: true,
				maxlength: 10,
				valid_loan_amt: true
			},
			'used_car_loan[car_registration_number]': {
				required: true
			},
			'used_car_loan[model_year]': {
				required: true
			},
			'used_car_loan[car_manufacturer]': {
				required: true
			},			
			'used_car_loan[tenure]': {
				required: true
			},
			"used_car_loan[terms_and_conditions]": {
				required: true
			},
			"used_car_loan[mobile_number]": {
				required: true,
				minlength: 10
			},
		},
		messages: {
			'used_car_loan[tenure]': {
				required: 'Please select tenure.'
			},
			'used_car_loan[loan_amount]': {
				required: 'Please enter loan amount.',
				maxlength: 'Loan amount must consist of at most 10 characters',
				valid_loan_amt: "Loan amount should be greator than or equal to ₹ 50,000."
			},
			'used_car_loan[car_manufacturer]': {
				required: 'Please select car manufacturer.',
			},
			'used_car_loan[car_registration_number]': {
				required: "Please enter car registration number."
			},
			'used_car_loan[model_year]': {
				required: "Please enter model year."
			},
			'used_car_loan[employment_type]': {
				required: 'Please select employment type.',
			},
			"used_car_loan[terms_and_conditions]": {
				required: "Please select terms and conditions."
			},
			"used_car_loan[mobile_number]": {
				required: "Please enter mobile number.",
				minlength: 'Mobile number must consist of at least 10 characters'
			},
		}
	});	

  $("#update_used_car_offer").validate({
  	rules: {
			"used_car_loan[full_name]": {
				required: true,
				full_name: true
			},
			"used_car_loan[dob]": {
				required: true,
			},
			"used_car_loan[email]": {
				required: true,
				email: true
			},
  	},
  	messages: {
			"used_car_loan[full_name]": {
				required: "Please enter full name.",
				full_name: "Please enter valid full name."
			},
			"used_car_loan[dob]": {
				required: "Please enter date of birth.",
			},
			"used_car_loan[email]": {
				required: "Please enter email.",
				email: "Please enter valid email."
			},
  	}	
  });

  $("#used_car_loan_address").validate({
		rules: {
			"used_car_loan[address]": {
				required: true,
				minlength: 20
			},
			"used_car_loan[city]": {
				required: true
			},
			"used_car_loan[pincode]": {
				required: true,
				minlength: 6,
				ucr_is_pincode: true
			},
			"used_car_loan[office_address]": {
				required: true,
				minlength: 20
			},
			"used_car_loan[office_city]": {
				required: true
			},
			"used_car_loan[office_pincode]": {
				required: true,
				minlength: 6,
				ucr_is_pincode: true
			},
		},
		messages: {
			"used_car_loan[address]": {
				required: "Please enter address.",
				minlength: "Address must consist of at least 20 characters.",
			},
			"used_car_loan[city]": {
				required: "Please select city."
			},
			"used_car_loan[pincode]": {
				required: "Please enter pincode.",
				minlength: "Pincode must consist of at least 6 characters.",
			},
			"used_car_loan[office_address]": {
				required: "Please enter address.",
				minlength: "Address must consist of at least 20 characters.",
			},
			"used_car_loan[office_city]": {
				required: "Please select city."
			},
			"used_car_loan[office_pincode]": {
				required: "Please enter pincode.",
				minlength: "Pincode must consist of at least 6 characters.",
			},
		}
	});

	$("#used_car_loan_assets").validate({
    errorPlacement: function(error, element) {
      element.parent().parent().append(error);
    },
		rules: {
			"used_car_loan[aadhar_front]": {
				required: true,
				file_type: true,
				file_size: true
			},
			"used_car_loan[aadhar_back]": {
				required: true,
				file_type: true,
				file_size: true
			},
		},
		messages: {
			"used_car_loan[aadhar_front]": {
				required: 'Please select aadhar card front.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
			"used_car_loan[aadhar_back]": {
				required: 'Please select aadhar card back.',
				file_type: 'File format should be jpg, jpeg, png or pdf.',
				file_size: 'File format should be less than 15 mb.'
			},
		}	
	})

});
