class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, authentication_keys: [:login]
  belongs_to :role, optional: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :mobile_number, presence: true, uniqueness: true
  has_one_attached :profile_image
  has_many :disbursements, dependent: :destroy
  has_many :channel_partners, dependent: :destroy
  has_many :login_entries, dependent: :destroy

  attr_writer :login

  def login
    @login || self.mobile_number || self.email
  end

	def self.find_for_database_authentication(warden_conditions)
	  conditions = warden_conditions.dup
	  if login = conditions.delete(:login)
	    where(conditions.to_h).where(["lower(mobile_number) = :value OR lower(email) = :value", { :value => login.downcase }]).first
	  elsif conditions.has_key?(:mobile_number) || conditions.has_key?(:email)
	    where(conditions.to_h).first
	  end
	end

	def full_name
		"#{self.first_name} #{self.last_name}"
	end

	def admin?
		['admin', 'super_admin'].include?(role.name)
	end

  def sales_manager?
    role.name == 'sales_manager'
  end

  def accountant?
    role.name == 'accountant'
  end
end
