class Bank < ApplicationRecord
  has_many :channel_partners
  has_many :login_entries
end
