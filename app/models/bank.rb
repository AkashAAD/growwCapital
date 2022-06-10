class Bank < ApplicationRecord
  has_many :channel_partners
  has_many :login_entries

  validates :name, presence: true, uniqueness: true
end
