$(document).ready(function(){
  $("#login-entry-channel-partner").chosen();

  $("#login_entry_state").change(function(evt) {
    if (evt.target.value == '') {
      $("#login_entry_city").html('<option value="">-Select City-</option>');
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
        $("#login_entry_city").html(options);
      }
    });
  });

  $("#login_entry_channel_partner").change(function(evt) {
    if (evt.target.value == '') {
      $("#login_entry_channel_partner_product_id").html('<option value="">-Select Product-</option>');
      $('.lg-channel-partner-name').html('');
      return;
    }
    $.ajax({
      url: "/personal-admin/home/channel-partner-products",
      dataType: "json",
      data: {
        id: evt.target.value
      },
      success: function (data) {
        var options = '';
        data.products.forEach(function(val) {
          options+= '<option value="' + val[1] + '">'+val[0]+'</option>' 
        });
        $("#login_entry_channel_partner_product_id").html(options);
        $('.lg-channel-partner-name').html(data.channel_partner.full_name);
      }
    });
  });

  $("#login_entry_channel_partner_type").change(function(evt) {
    $("#login_entry_channel_partner").html('<option value="">-Select Channel Partner-</option>');
    $("#login_entry_channel_partner_product_id").html('<option value="">-Select Product-</option>');
    $('.lg-channel-partner-name').html('');

    $.ajax({
      url: "/personal-admin/home/channel-partners",
      dataType: "json",
      data: { id: event.target.value },
      success: function (data) {
        var options = '<option value="">-Select Channel Partner-</option>';
        data.channel_partners.forEach(function(val) {
          options+= '<option value="' + val['id'] + '">' + val['full_name'] + '</option>'
        });
        $("#login_entry_channel_partner").html(options);
      }
    });
  });
});
