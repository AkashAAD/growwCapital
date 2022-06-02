class ChannelPartnerType < ApplicationRecord
  has_many :users
  has_many :channel_partners
end
