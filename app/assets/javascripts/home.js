$(document).ready(function(){

  jQuery.validator.addMethod("full_name", function(value, element) {
    return value.split(" ").length >= 2;
  }, "");

	$("#contact_us").validate({
		rules: {
			"contact_u[first_name]": {
				required: true
			},
			"contact_u[last_name]": {
				required: true
			},
			"contact_u[email]": {
				required: true,
				email: true
			},
			"contact_u[subject]": {
				required: true
			},
			"contact_u[message]": {
				required: true
			}
		},
		messages: {
			"contact_u[first_name]": {
				required: "Please enter first name"
			},
			"contact_u[last_name]": {
				required: "Please enter last name"
			},
			"contact_u[email]": {
				required: "Please enter email"
			},
			"contact_u[subject]": {
				required: "Please enter subject"
			},
			"contact_u[message]": {
				required: "Please enter message"
			}
		}
	});

  $("#new_custom_credit_card").validate({
    rules: {
      "custom_credit_card[full_name]": {
        required: true,
        full_name: true
      },
      "custom_credit_card[mobile_number]": {
        required: true,
        minlength: 10
      },
      "custom_credit_card[email]": {
        required: true,
        email: true
      },
      "custom_credit_card[loan_purpose]": {
        required: true
      }
    },
    messages: {
      "custom_credit_card[full_name]": {
        required: "Please enter full name",
        full_name: "Please enter validate full name."
      },
      "custom_credit_card[mobile_number]": {
        required: "Please enter last name",
        minlength: "Please enter atmost 10 numbers."
      },
      "custom_credit_card[email]": {
        required: "Please enter email",
        email: "Please enter correct email"
      },
      "custom_credit_card[loan_purpose]": {
        required: "Please select purpose of credit card."
      }
    },
    invalidHandler: function(event, validator) {
      $(".form-group").css({"padding-bottom": "0px !important"});
    }
  });

  $("#new_custom_personal_loan").validate({
    rules: {
      "custom_personal_loan[full_name]": {
        required: true,
        full_name: true
      },
      "custom_personal_loan[mobile_number]": {
        required: true,
        minlength: 10
      },
      "custom_personal_loan[email]": {
        required: true,
        email: true
      },
      "custom_personal_loan[loan_purpose]": {
        required: true
      }
    },
    messages: {
      "custom_personal_loan[full_name]": {
        required: "Please enter full name",
        full_name: "Please enter validate full name."
      },
      "custom_personal_loan[mobile_number]": {
        required: "Please enter last name",
        minlength: "Please enter atmost 10 numbers."
      },
      "custom_personal_loan[email]": {
        required: "Please enter email",
        email: "Please enter correct email"
      },
      "custom_personal_loan[loan_purpose]": {
        required: "Please select purpose of loan"
      }
    },
    invalidHandler: function(event, validator) {
      $(".form-group").css({"padding-bottom": "0px !important"});
    }
  });

  $("#new_custom_transfer_personal_loan").validate({
    rules: {
      "custom_transfer_personal_loan[full_name]": {
        required: true,
        full_name: true
      },
      "custom_transfer_personal_loan[mobile_number]": {
        required: true,
        minlength: 10
      },
      "custom_transfer_personal_loan[email]": {
        required: true,
        email: true
      },
      "custom_transfer_personal_loan[loan_purpose]": {
        required: true
      }
    },
    messages: {
      "custom_transfer_personal_loan[full_name]": {
        required: "Please enter full name",
        full_name: "Please enter validate full name."
      },
      "custom_transfer_personal_loan[mobile_number]": {
        required: "Please enter last name",
        minlength: "Please enter atmost 10 numbers."
      },
      "custom_transfer_personal_loan[email]": {
        required: "Please enter email",
        email: "Please enter correct email"
      },
      "custom_transfer_personal_loan[loan_purpose]": {
        required: "Please select purpose of loan"
      }
    },
    invalidHandler: function(event, validator) {
      $(".form-group").css({"padding-bottom": "0px !important"});
    }
  });

  $("#new_custom_business_loan").validate({
    rules: {
      "custom_business_loan[full_name]": {
        required: true,
        full_name: true
      },
      "custom_business_loan[mobile_number]": {
        required: true,
        minlength: 10
      },
      "custom_business_loan[email]": {
        required: true,
        email: true
      },
      "custom_business_loan[loan_purpose]": {
        required: true
      }
    },
    messages: {
      "custom_business_loan[full_name]": {
        required: "Please enter full name",
        full_name: "Please enter validate full name."
      },
      "custom_business_loan[mobile_number]": {
        required: "Please enter last name",
        minlength: "Please enter atmost 10 numbers."
      },
      "custom_business_loan[email]": {
        required: "Please enter email",
        email: "Please enter correct email"
      },
      "custom_business_loan[loan_purpose]": {
        required: "Please select purpose of loan"
      }
    },
    invalidHandler: function(event, validator) {
      $(".form-group").css({"padding-bottom": "0px !important"});
    }
  });

  $("#new_custom_professional_loan").validate({
    rules: {
      "custom_professional_loan[full_name]": {
        required: true,
        full_name: true
      },
      "custom_professional_loan[mobile_number]": {
        required: true,
        minlength: 10
      },
      "custom_professional_loan[email]": {
        required: true,
        email: true
      },
      "custom_professional_loan[loan_purpose]": {
        required: true
      }
    },
    messages: {
      "custom_professional_loan[full_name]": {
        required: "Please enter full name",
        full_name: "Please enter validate full name."
      },
      "custom_professional_loan[mobile_number]": {
        required: "Please enter last name",
        minlength: "Please enter atmost 10 numbers."
      },
      "custom_professional_loan[email]": {
        required: "Please enter email",
        email: "Please enter correct email"
      },
      "custom_professional_loan[loan_purpose]": {
        required: "Please select purpose of loan"
      }
    },
    invalidHandler: function(event, validator) {
      $(".form-group").css({"padding-bottom": "0px !important"});
    }
  });

  $("#new_custom_home_loan").validate({
    rules: {
      "custom_home_loan[full_name]": {
        required: true,
        full_name: true
      },
      "custom_home_loan[mobile_number]": {
        required: true,
        minlength: 10
      },
      "custom_home_loan[email]": {
        required: true,
        email: true
      },
      "custom_home_loan[loan_purpose]": {
        required: true
      }
    },
    messages: {
      "custom_home_loan[full_name]": {
        required: "Please enter full name",
        full_name: "Please enter validate full name."
      },
      "custom_home_loan[mobile_number]": {
        required: "Please enter last name",
        minlength: "Please enter atmost 10 numbers."
      },
      "custom_home_loan[email]": {
        required: "Please enter email",
        email: "Please enter correct email"
      },
      "custom_home_loan[loan_purpose]": {
        required: "Please select purpose of loan"
      }
    },
    invalidHandler: function(event, validator) {
      $(".form-group").css({"padding-bottom": "0px !important"});
    }
  });

  $("#new_custom_transfer_home_loan").validate({
    rules: {
      "custom_transfer_home_loan[full_name]": {
        required: true,
        full_name: true
      },
      "custom_transfer_home_loan[mobile_number]": {
        required: true,
        minlength: 10
      },
      "custom_transfer_home_loan[email]": {
        required: true,
        email: true
      },
      "custom_transfer_home_loan[loan_purpose]": {
        required: true
      }
    },
    messages: {
      "custom_transfer_home_loan[full_name]": {
        required: "Please enter full name",
        full_name: "Please enter validate full name."
      },
      "custom_transfer_home_loan[mobile_number]": {
        required: "Please enter last name",
        minlength: "Please enter atmost 10 numbers."
      },
      "custom_transfer_home_loan[email]": {
        required: "Please enter email",
        email: "Please enter correct email"
      },
      "custom_transfer_home_loan[loan_purpose]": {
        required: "Please select purpose of loan"
      }
    },
    invalidHandler: function(event, validator) {
      $(".form-group").css({"padding-bottom": "0px !important"});
    }
  });

  $("#new_custom_loan_against_property").validate({
    rules: {
      "custom_loan_against_property[full_name]": {
        required: true,
        full_name: true
      },
      "custom_loan_against_property[mobile_number]": {
        required: true,
        minlength: 10
      },
      "custom_loan_against_property[email]": {
        required: true,
        email: true
      },
      "custom_loan_against_property[loan_purpose]": {
        required: true
      }
    },
    messages: {
      "custom_loan_against_property[full_name]": {
        required: "Please enter full name",
        full_name: "Please enter validate full name."
      },
      "custom_loan_against_property[mobile_number]": {
        required: "Please enter last name",
        minlength: "Please enter atmost 10 numbers."
      },
      "custom_loan_against_property[email]": {
        required: "Please enter email",
        email: "Please enter correct email"
      },
      "custom_loan_against_property[loan_purpose]": {
        required: "Please select purpose of loan"
      }
    }
  });

  $("#new_custom_new_car_loan").validate({
    rules: {
      "custom_new_car_loan[full_name]": {
        required: true,
        full_name: true
      },
      "custom_new_car_loan[mobile_number]": {
        required: true,
        minlength: 10
      },
      "custom_new_car_loan[email]": {
        required: true,
        email: true
      },
      "custom_new_car_loan[loan_purpose]": {
        required: true
      }
    },
    messages: {
      "custom_new_car_loan[full_name]": {
        required: "Please enter full name",
        full_name: "Please enter validate full name."
      },
      "custom_new_car_loan[mobile_number]": {
        required: "Please enter last name",
        minlength: "Please enter atmost 10 numbers."
      },
      "custom_new_car_loan[email]": {
        required: "Please enter email",
        email: "Please enter correct email"
      },
      "custom_new_car_loan[loan_purpose]": {
        required: "Please select purpose of loan"
      }
    }
  });

  $("#new_custom_used_car_loan").validate({
    rules: {
      "custom_used_car_loan[full_name]": {
        required: true,
        full_name: true
      },
      "custom_used_car_loan[mobile_number]": {
        required: true,
        minlength: 10
      },
      "custom_used_car_loan[email]": {
        required: true,
        email: true
      },
      "custom_used_car_loan[loan_purpose]": {
        required: true
      }
    },
    messages: {
      "custom_used_car_loan[full_name]": {
        required: "Please enter full name",
        full_name: "Please enter validate full name."
      },
      "custom_used_car_loan[mobile_number]": {
        required: "Please enter last name",
        minlength: "Please enter atmost 10 numbers."
      },
      "custom_used_car_loan[email]": {
        required: "Please enter email",
        email: "Please enter correct email"
      },
      "custom_used_car_loan[loan_purpose]": {
        required: "Please select purpose of loan"
      }
    }
  });

  $("#new_custom_gold_loan").validate({
    rules: {
      "custom_gold_loan[full_name]": {
        required: true,
        full_name: true
      },
      "custom_gold_loan[mobile_number]": {
        required: true,
        minlength: 10
      },
      "custom_gold_loan[email]": {
        required: true,
        email: true
      },
      "custom_gold_loan[loan_purpose]": {
        required: true
      }
    },
    messages: {
      "custom_gold_loan[full_name]": {
        required: "Please enter full name",
        full_name: "Please enter validate full name."
      },
      "custom_gold_loan[mobile_number]": {
        required: "Please enter last name",
        minlength: "Please enter atmost 10 numbers."
      },
      "custom_gold_loan[email]": {
        required: "Please enter email",
        email: "Please enter correct email"
      },
      "custom_gold_loan[loan_purpose]": {
        required: "Please select purpose of loan"
      }
    }
  });

  $("#new_custom_insurance").validate({
    rules: {
      "custom_insurance[full_name]": {
        required: true,
        full_name: true
      },
      "custom_insurance[mobile_number]": {
        required: true,
        minlength: 10
      },
      "custom_insurance[email]": {
        required: true,
        email: true
      },
      "custom_insurance[loan_purpose]": {
        required: true
      }
    },
    messages: {
      "custom_insurance[full_name]": {
        required: "Please enter full name",
        full_name: "Please enter validate full name."
      },
      "custom_insurance[mobile_number]": {
        required: "Please enter last name",
        minlength: "Please enter atmost 10 numbers."
      },
      "custom_insurance[email]": {
        required: "Please enter email",
        email: "Please enter correct email"
      },
      "custom_insurance[loan_purpose]": {
        required: "Please select purpose of loan"
      }
    }
  });

  $("#frm-apply-now").validate({
    rules: {
      "instant_call[full_name]": {
        required: true,
        full_name: true
      },
      "instant_call[mobile_number]": {
        required: true
      },
      "instant_call[product_name]": {
        required: true,
      },
    },
    messages: {
      "instant_call[full_name]": {
        required: "Please enter full name.",
        full_name: "Please enter validate full name."
      },
      "instant_call[mobile_number]": {
        required: "Please enter mobile number."
      },
      "instant_call[product_name]": {
        required: "Please select product name.",
      },
    }
  });

  $("#let-u-call-u").click(function() {
    document.getElementById("instant-call").reset();
  });


  function delay(callback, ms) {
	  var timer = 0;
	  return function() {
	    var context = this, args = arguments;
	    clearTimeout(timer);
	    timer = setTimeout(function () {
	      callback.apply(context, args);
	    }, ms || 0);
	  };
  }
  var predictions = [{loan: 'Personal Loan', link: "/personal_loan/step1", type: 'loan'},
    {loan: 'Business Loan', link: "/business_loan/step1", type: 'loan'},
    {loan: 'Professional Loan', link: "/professional_loan/step1", type: 'loan'},
    {loan: 'Home Loan', link: "/home_loan/step1", type: 'loan'},
    {loan: 'Loan Against Property', link: "/loan_against_property/step1", type: 'loan'},
    {loan: 'Car Loan', link: "/new_car_loan/step1", type: 'loan'},
    {loan: 'Used Car Loan', link: "/used_car_loan/step1", type: 'loan'},
    // {loan: 'Axis Bank Credit Card', link: "#", type: 'card'},
    // {loan: 'SBI Bank Credit Card', link: "#", type: 'card'},
    // {loan: 'IndusInd Bank Credit Card', link: "#", type: 'card'},
    // {loan: 'HDFC Bank Credit Card', link: "#", type: 'card'},
    // {loan: 'ICICI Bank Credit Card', link: "#", type: 'card'}
    ];

  $(".search-loan").focus(function(){
    searchLoans(this.value, 'focus');
  });

  // .blur(function(event) {
  //   $('#loan-autocomplete-list').remove();
  // });

  $(document).click(function(e) {
    if(e.target.id != "search-loan") {
      $('#loan-autocomplete-list').remove();
    }
  });



	$(".search-loan").keydown(delay(function () {
    searchLoans(this.value, 'key');
	}));

  function searchLoans(_searchVal, state) {
    var $html = '';
    if(!_searchVal && state == 'key') {
      $('#loan-autocomplete-list').remove();
      return false;
    }
    $('#loan-autocomplete-list').remove();    
    $html += '<ul class="predictions" >';
    var loans = '<li class="loans">Loans</li>';
    var cards = '<li class="cards">Credit Card</li>';
    predictions.forEach(function (item) {
      if ((_searchVal == '' && state == 'focus') || item.loan.toLocaleLowerCase().includes(_searchVal.toLocaleLowerCase())) {
        if(item.type == 'loan') {
          var loan = '';
          loan += '<li>';
          loan += '<a href="'+ item.link +'" class="s-loan">';
          loan += item.loan;
          loan += '</a>';
          loan += '</li>';
          loans += loan;
        } else if(item.type == 'card') {
          var card = '';
          card += '<li>';
          card += '<a href="'+ item.link +'" class="s-loan">';
          card += item.loan;
          card += '</a>';
          card += '</li>';
          cards += card;
        }
      }
    });
    $html += loans;
    $html += cards;
    $html += '</ul>';
    var a = document.createElement("DIV");
    a.setAttribute("id", "loan-autocomplete-list");
    a.setAttribute("class", "loan-autocomplete-list");
    $(".search-loan").parent('form').append(a);
    var innerDiv = document.createElement("DIV");
    innerDiv.innerHTML = $html;
    a.append(innerDiv);
  }

  $("#pre_approved_offer").validate({
    rules: {
      "pre_approved_offer[first_name]": {
        required: true
      },
      "pre_approved_offer[last_name]": {
        required: true
      },
      "pre_approved_offer[mobile_no]": {
        required: true,
        minlength: 10
      },
    },
    messages: {
      "pre_approved_offer[first_name]": {
        required: 'Please enter first name.'
      },
      "pre_approved_offer[last_name]": {
        required: 'Please enter last name.'
      },
      "pre_approved_offer[mobile_no]": {
        required: 'Please enter mobile number.',
        minlength: 'Mobile number must consist of at least 10 characters'
      },
    }
  });


  $(".sldLoanAmount").on('input', function () {
    var per = (this.value/100000)*100;
    this.style.background = 'linear-gradient(to right, #0854a0 0%, #82CFD0 ' + per + '%, #fff ' + per + '%, white 100%)';
    $(".loanAmount").val(this.value);
    calculateEMI(this.value, $(".loanRoi").val(), $(".loanTen").val());
  });

  $(".loanAmount").on('input', function () {
    if(this.value <=1 ){
      // this.value = 1;
    } else if(this.value >= 100000) {
      this.value = 100000;
    };
    var per = (this.value/100000)*100;
    $(".sldLoanAmount").css("background", 'linear-gradient(to right, #0854a0 0%, #82CFD0 ' + per + '%, #fff ' + per + '%, white 100%)');
    $(".sldLoanAmount").val(this.value);
    calculateEMI(this.value, $(".loanRoi").val(), $(".loanTen").val());
  });

  $(".sldLoanRoi").on('input', function () {
    var per = (this.value/100)*100;
    this.style.background = 'linear-gradient(to right, #0854a0 0%, #82CFD0 ' + per + '%, #fff ' + per + '%, white 100%)';
    $(".loanRoi").val(this.value);
    calculateEMI($(".loanAmount").val(), this.value, $(".loanTen").val());
  });

  $(".loanRoi").on('input', function () {
    if(this.value <=1 ){
      // this.value = 1;
    } else if(this.value >= 100) {
      this.value = 100;
    };
    var per = (this.value/100)*100;
    $(".sldLoanRoi").css("background", 'linear-gradient(to right, #0854a0 0%, #82CFD0 ' + per + '%, #fff ' + per + '%, white 100%)');
    $(".sldLoanRoi").val(this.value);
    calculateEMI($(".loanAmount").val(), this.value, $(".loanTen").val());
  });

  $(".sldLoanTen").on('input', function () {
    var per = (this.value/500)*100;
    this.style.background = 'linear-gradient(to right, #0854a0 0%, #82CFD0 ' + per + '%, #fff ' + per + '%, white 100%)';
    $(".loanTen").val(this.value);
    calculateEMI($(".loanAmount").val(), $(".loanRoi").val(), this.value);
  });

  $(".loanTen").on('input', function () {
    if(this.value <=1 ){
      // this.value = 1;
    } else if(this.value >= 500) {
      this.value = 500;
    };
    var per = (this.value/500)*100;
    $(".sldLoanTen").css("background", 'linear-gradient(to right, #0854a0 0%, #82CFD0 ' + per + '%, #fff ' + per + '%, white 100%)');
    $(".sldLoanTen").val(this.value);
    calculateEMI($(".loanAmount").val(), $(".loanRoi").val(), this.value);
  });

  var totAmt = 0;
  var totRoi = 0;
  var myPieChart;

  function calculateEMI(amount, roi, tenure) {
    if(myPieChart) {
      myPieChart.destroy();
    }
    var r = roi / (12 * 100);
    var t = tenure * 12;
    emi = (amount * r * (Math.pow(1 + r, t)))/(Math.pow(1 + r, t) - 1);
    $(".mon-emi").text("₹ " + Math.round(emi));
    totAmt = Math.round(amount);    
    $(".pri-amt").text("₹ " + totAmt);
    $(".tot-amt").text("₹ " + Math.round(Math.round(emi) * t));
    totRoi = Math.round(Math.round(emi) * t) - Math.round(amount);
    $(".tot-int").text("₹ " + totRoi);
    loadChart();
  }

  window.onload = loadChart();
  function loadChart() {
    var ctx = document.getElementById('emiCalcChart');
    if(ctx){
      // ctx.getContext('2d');
      // ctx.canvas.width = 400;
      // ctx.canvas.height = 400;
      var data = {
        datasets: [{
          data: [totAmt, totRoi],
          backgroundColor: ['#0854a0', '#ee4031'],
          borderColor: ['#0854a0', '#ee4031'],
        }],
        labels: [
          'Principal Amount',
          'Interest Amount',
        ]
      };

      myPieChart = new Chart(ctx, {
        type: 'doughnut',
        data: data,
        options: {
        responsive: true,
        maintainAspectRatio: false,
        // scales: {
        //   yAxes: [{
        //       ticks: {
        //           beginAtZero:true
        //       }
        //   }]
        // }
        }
      });
    }
  }

});