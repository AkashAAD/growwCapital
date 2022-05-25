class Executive < ApplicationRecord
  has_many :login_entries
  belongs_to :user

  validates :full_name, :code, presence: true
  validates :full_name, uniqueness: { scope: :code }

  validates :full_name, format: /\w+ \w+/
end
