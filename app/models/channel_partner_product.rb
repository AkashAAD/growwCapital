class ChannelPartnerProduct < ApplicationRecord
  belongs_to :channel_partner
  belongs_to :product
  has_many :login_entries
end
