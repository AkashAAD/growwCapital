$(document).ready(function(){
  $("#disbursement_login_entry_id").chosen();
  $("#disburse-channel-partner").chosen();

  $("#disbursement_login_entry_id").change(function(evt) {
    if (evt.target.value == '') {
      $('#disbursement_customer_full_name').val('');
      $('#disbursement_business_name').val('');
      $('#disbursement_customer_id').val('');
      $('#disbursement_mobile_number').val('');
      $('#disbursement_email').val('');
      $('#disbursement_dob').val('');
      $('#disbursement_state').html('<option value="">-Select State-</option>')
      $('#disbursement_city').html('<option value="">-Select City-</option>');
      $('#disbursement_process_date').val('')
      $('#disbursement_channel_partner').html('<option value="">-Select Channel Partner-</option>');
      $('#disbursement_product_name').html('<option value="">-Select Product Name-</option>');
      $('#disbursement_executive_name').html('<option value="">-Select Executive Name-</option>');
      return;
    }

    $.ajax({
      url: "/personal-admin/home/channel-login-entry",
      dataType: "json",
      data: {
        id: evt.target.value
      },
      success: function (data) {
        var login_entry = data.login_entry;

        $('#disbursement_customer_full_name').val(login_entry.customer_full_name);
        $('#disbursement_business_name').val(login_entry.business_name);
        $('#disbursement_customer_id').val(login_entry.customer_id);
        $('#disbursement_mobile_number').val(login_entry.mobile_number);
        $('#disbursement_email').val(login_entry.email);
        $('#disbursement_dob').val(data.dob);
        $('#disbursement_state').html('<option value="">'+ data.state +'</option>')
        $('#disbursement_city').html('<option value="">'+ data.city +'</option>');
        $('#disbursement_process_date').val(data.process_date);
        $('#disbursement_channel_partner').html('<option value="">'+ data.channel_partner.full_name +'</option>');
        $('#disbursement_product_name').html('<option value="">'+ data.product_name +'</option>');
        $('#disbursement_executive_name').html('<option value="">'+ data.executive.full_name +'</option>');
        $('.channel-partner-code').html(data.channel_partner.code);
        $('.channel-partner-name').html(data.channel_partner.full_name);
      }
    });
  });
});
