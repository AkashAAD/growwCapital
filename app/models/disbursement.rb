class Disbursement < ApplicationRecord
  include Products
  validates :customer_full_name, :business_name, :location, :mobile_number, :loan_type, :loan_amount, :annual_fee, :process_date, :disburse_date, :disburse_amount, :roi, :bt_inhancement, :cc_apply, :health_insurance, :executive_full_name, :channel_name, :customer_id, :remark, :dob, presence: true

  def product_type
    loan_type.gsub('_', ' ').capitalize
  end
end
