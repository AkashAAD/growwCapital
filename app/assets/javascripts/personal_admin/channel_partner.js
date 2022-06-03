$(document).ready(function(){ 
  $("#channel_partner_state").change(function(evt) {
    if (evt.target.value == '') {
      $("#channel_partner_city").html('<option value="">-Select City-</option>');
      return;
    }
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
        $("#channel_partner_city").html(options);
      }
    });
  });

  $('#add-more-product').click(function() {
    if(!$('#channel_partner_product').val()) {
      alert('Please select product.');
      return false;
    } else if(!$('#channel_partner_payout_percent').val()) {
      alert('Please select product payout percentage.');
      return false;
    }

    var all_products = [];
    $('.dis-product').each(function () { all_products.push($(this).val()); });
    var total_rows = $('.product-table').find('tr').length - 1;

    if(all_products.includes($('#channel_partner_product').val())) {
      alert($('#channel_partner_product').val() +' value already added in the list.');
      return false;
    }

    $('.product-table').append(
      '<tr>'+
        '<td><input type="text" name="channel_partner[products]['+ total_rows +'][product_slug]" value="'+ $('#channel_partner_product').val() +'" class="form-control dis-product" readonly /></td>'+
        '<td><input type="number" name="channel_partner[products]['+ total_rows +'][product_payout_percent]" value="'+ $('#channel_partner_payout_percent').val() +'" class="form-control dis-percentage" readonly /></td>'+
        '<td><a href="javascript:void(0)" class="remove-product"><i class="fa fa-remove"></i></a></td>'+
      '</tr>'
    );

    $('#channel_partner_product').val('')
    $('#channel_partner_payout_percent').val('')

    $('.remove-product').click(function() {
      $(this).parent().parent().remove();
    });
  });

  $('.remove-product').click(function() {
    $(this).parent().parent().remove();
  });
});
