$(document).ready(function(){
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
      $("#login_entry_product_name").html('<option value="">-Select Product-</option>');
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
        $("#login_entry_product_name").html(options);
      }
    });
  });

});
