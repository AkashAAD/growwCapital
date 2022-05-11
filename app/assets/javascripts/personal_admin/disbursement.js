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
});
