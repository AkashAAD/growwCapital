class Card < ApplicationRecord
  has_one_attached :bank_image
  has_one :credit_card
end
