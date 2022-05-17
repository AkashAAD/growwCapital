class Disbursement < ApplicationRecord
  include Products
  belongs_to :channel_partner

  validates :customer_full_name,
    :business_name,
    :email,
    :state,
    :city,
    :mobile_number,
    :product_name,
    :process_date,
    :disburse_date,
    :processing_fee,
    :disburse_amount,
    :roi,
    :bank_insurance,
    :executive_full_name,
    :customer_id,
    :remark,
    :dob, presence: true

  validates :customer_full_name, :executive_full_name, format: /\w+ \w+/
  validates :bt_inhancement, :cc_apply, :insurance, inclusion: { in: [true, false], message: '' }
  validates :bt_inhancement, exclusion: { in: [nil, ''], message: 'can\'t be empty' }
  validates :insurance, exclusion: { in: [nil, ''], message: 'can\'t be empty' }
  validates :cc_apply, exclusion: { in: [nil, ''], message: 'can\'t be empty' }
  validates_length_of :mobile_number, is: 10,  message: 'Number must be 10 digit long'
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :dob_validation

  def channel_partners
    [['-Select Channel Partner-','']] + ChannelPartner.all.map{ |val| [val.code, val.code] }.uniq
  end

  def product_type
    product_name.gsub('_', ' ').capitalize
  end

  def dob_validation
    if dob
      max = (Time.zone.now - 21.years)
      min = (Time.zone.now - 21.years) - 60.years
      errors.add(:dob, 'Please enter valid dob.') if !(dob < max && dob > min)
    end
  end
end
