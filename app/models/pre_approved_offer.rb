class PreApprovedOffer < ApplicationRecord
  validates_uniqueness_of :mobile_no
end
