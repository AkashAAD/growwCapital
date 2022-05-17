class ChannelPartner < ApplicationRecord
  has_many :disbursements
  validates :full_name, :code, uniqueness: true
  validates :full_name, :code, presence: true 
end
