class LoginEntry < ApplicationRecord
  include Products
  belongs_to :user
  belongs_to :channel_partner
  has_one :disbursement, dependent: :destroy

  validates :customer_full_name,
    :business_name,
    :email,
    :state,
    :city,
    :mobile_number,
    :product_name,
    :process_date,
    :channel_partner_id,
    :customer_id,
    :dob, presence: true

  validates :customer_full_name, format: /\w+ \w+/
  validates_length_of :mobile_number, is: 10,  message: 'Number must be 10 digit long'
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :dob_validation


  def channel_partners
    ChannelPartner.all
  end

  def dob_validation
    if dob
      max = (Time.zone.now - 21.years)
      min = (Time.zone.now - 21.years) - 60.years
      errors.add(:dob, 'Please enter valid dob.') if !(dob < max && dob > min)
    end
  end
end
