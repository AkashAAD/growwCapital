$(document).ready(function(){
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
    {loan: 'Used Loan', link: "/used_car_loan/step1", type: 'loan'},
    {loan: 'Axis Bank Credit Card', link: "#", type: 'card'},
    {loan: 'SBI Bank Credit Card', link: "#", type: 'card'},
    {loan: 'IndusInd Bank Credit Card', link: "#", type: 'card'},
    {loan: 'HDFC Bank Credit Card', link: "#", type: 'card'},
    {loan: 'ICICI Bank Credit Card', link: "#", type: 'card'}];
	$(".search-loan").keydown(delay(function () {
    var _searchVal = this.value;
    var $html = '';
    if(!_searchVal) {
      $('#loan-autocomplete-list').remove();
      return false;
    }
    $('#loan-autocomplete-list').remove();    
    $html += '<ul class="predictions" >';
    var loans = '<li class="loans">Loans</li>';
    var cards = '<li class="cards">Cards</li>';
    predictions.forEach(function (item) {
    	if (item.loan.toLocaleLowerCase().includes(_searchVal.toLocaleLowerCase())) {
    		if(item.type == 'loan') {
          var loan = '';
          loan += '<li>';
          loan += '<a href="'+ item.link +'" class="">';
          loan += item.loan;
          loan += '</a>';
          loan += '</li>';
          loans += loan;
    		} else if(item.type == 'card') {
          var card = '';
          card += '<li>';
          card += '<a href="'+ item.link +'" class="">';
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
	}));

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


});