class PersonalLoan < ApplicationRecord
  has_one_attached :id_proof
  has_one_attached :address_proof
  has_one_attached :salary_slip
  has_one_attached :passport_photo
end
