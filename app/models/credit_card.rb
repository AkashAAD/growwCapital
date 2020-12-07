class CreditCard < ApplicationRecord
  has_one_attached :aadhar_front
  has_one_attached :aadhar_back
  belongs_to :card, optional: true
  def cards
  	Card.all
  end
end
