class ChannelPartnerType < ApplicationRecord
  has_and_belongs_to_many :users, optional: true
  has_many :channel_partners
  has_many :login_entries
end
