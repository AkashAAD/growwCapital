$(document).ready(function(){
  $("#disbursement_state").change(function(evt) {
    if (evt.target.value == '') {
      $("#disbursement_city").html('<option value="">-Select City-</option>');
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
        $("#disbursement_city").html(options);
      }
    });
  });

  $("#disbursement_channel_partner_id").change(function(evt) {
    if (evt.target.value == '') {
      $('.channel-partner-name').html('NA');
      return;
    }
    $.ajax({
      url: "/sales-manager/channel_partner",
      dataType: "json",
      data: {
        code: evt.target.value
      },
      success: function (data) {
        $('.channel-partner-name').html(data.name);
      }
    });
  });
});
