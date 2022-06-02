class ChannelPartner < ApplicationRecord
  include Products

  belongs_to :user
  belongs_to :bank
  belongs_to :channel_partner_type
  has_many :channel_partner_products, dependent: :destroy
  has_many :products, through: :channel_partner_products
  has_many :login_entries, dependent: :destroy

  validates :full_name, :code, :email, :mobile_number, uniqueness: true
  validates :full_name,
    :code,
    :email,
    :mobile_number,
    :channel_partner_products,
    :firm_name,
    :state,
    :city,
    :onbording_date,
    :bank_id,
    :account_number,
    :ifsc_code,
    :micr_code,
    :name_as_per_bank,
    :bank_account_type,
    :channel_partner_type_id,
    :aadhar_number,
    :pan_number,
    :full_address, presence: true

  validates_length_of :mobile_number, is: 10,  message: 'Number must be 10 digit long'
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :full_name, format: /\w+ \w+/

  def channel_partner_types
    ChannelPartnerType.all.pluck(:name, :slug)
  end
end
