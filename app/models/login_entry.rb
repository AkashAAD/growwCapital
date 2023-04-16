class LoginEntry < ApplicationRecord
  include Products
  belongs_to :user
  belongs_to :channel_partner
  belongs_to :channel_partner_type
  belongs_to :channel_partner_product
  belongs_to :executive
  belongs_to :bank
  has_one :disbursement, dependent: :destroy
  has_many :reference_contacts

  scope :approved_login_entires, -> { where(approved: true, payment: false) }

  validates :customer_full_name,
    :business_name,
    :email,
    :state,
    :city,
    :mobile_number,
    :channel_partner_product_id,
    :process_date,
    :channel_partner_id,
    :customer_id,
    :executive_id,
    :bank_id,
    :loan_amount,
    :notes,
    :dob, presence: true

  validates :customer_full_name, format: /\w+ \w+/
  validates_length_of :mobile_number, is: 10,  message: 'Number must be 10 digit long'
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :dob_validation

  def channel_partners(channel_partner_type)
    ChannelPartner.where(channel_partner_type_id: channel_partner_type)
  end

  def executives
    Executive.all.undeleted
  end

  def dob_validation
    if dob
      max = (Time.zone.now - 21.years)
      min = (Time.zone.now - 21.years) - 60.years
      errors.add(:dob, 'Please enter valid dob.') if !(dob < max && dob > min)
    end
  end
end
