class Employer < ApplicationRecord
  scope :search_employer, ->(text) { where("name LIKE ?", "%#{text}%") }
end
