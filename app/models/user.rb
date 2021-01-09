class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, authentication_keys: [:login]
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :mobile_number, presence: true, uniqueness: true
  has_one_attached :profile_image
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
end
