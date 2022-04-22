class UsedCarLoanController < ApplicationController


  def is_preapproved
    pre_approved_offer = PreApprovedOffer.find_by(mobile_no: @used_car_loan.mobile_number)
    return if @used_car_loan.mobile_number == pre_approved_offer&.mobile_no

    pre_approved_offer = PreApprovedOffer.new(
      mobile_no: @used_car_loan.mobile_number,
      reference_number: "PREAPRO#{(rand * 100000000).to_i}",
      first_name: @used_car_loan.full_name,
      last_name: @used_car_loan.full_name
    )

    pre_approved_offer.save!
  end
end
