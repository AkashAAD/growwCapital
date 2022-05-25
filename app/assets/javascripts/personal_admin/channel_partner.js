$(document).ready(function(){ 
  $("#channel_partner_products").chosen({
    allow_single_deselect: true,
    width: '200px'
  });

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
});
