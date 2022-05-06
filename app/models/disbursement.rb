class Disbursement < ApplicationRecord
  include Products
  validates :customer_full_name, :business_name, :location, :mobile_number, :loan_type, :loan_amount, :annual_fee, :process_date, :disburse_date, :disburse_amount, :roi, :executive_full_name, :channel_name, :customer_id, :remark, :dob, presence: true
  validates :bt_inhancement, :cc_apply, :health_insurance, inclusion: { in: [true, false], message: '' }
  validates :bt_inhancement, exclusion: { in: [nil, ''], message: 'can\'t be empty' }
  validates :health_insurance, exclusion: { in: [nil, ''], message: 'can\'t be empty' }
  validates :cc_apply, exclusion: { in: [nil, ''], message: 'can\'t be empty' }

  def product_type
    loan_type.gsub('_', ' ').capitalize
  end
end
