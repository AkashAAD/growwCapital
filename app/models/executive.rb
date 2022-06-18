class Executive < ApplicationRecord
  has_many :login_entries, dependent: :destroy
  belongs_to :user

  validates :full_name, :code, presence: true
  validates :full_name, uniqueness: { scope: :code }
  scope :undeleted, -> { where(soft_delete: false) }

  validates :full_name, format: /\w+ \w+/
end
