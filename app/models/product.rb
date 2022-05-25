class Product < ApplicationRecord
  has_many :channel_partner_products
  has_many :channel_partners, through: :channel_partner_products
end
