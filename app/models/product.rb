class Product < ApplicationRecord
  include SlugConcern

  has_many :channel_partner_products, dependent: :destroy
  has_many :channel_partners, through: :channel_partner_products

  validates :name, presence: true, uniqueness: true
end
