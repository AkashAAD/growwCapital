class Disbursement < ApplicationRecord
  include Products
  belongs_to :user
  belongs_to :login_entry

  validates :disburse_date,
    :processing_fee,
    :disburse_amount,
    :roi,
    :login_entry_id,
    :bank_insurance,
    :remark, presence: true

  validates :bt_inhancement, :cc_apply, :insurance, inclusion: { in: [true, false], message: '' }
  validates :bt_inhancement, exclusion: { in: [nil, ''], message: 'can\'t be empty' }
  validates :insurance, exclusion: { in: [nil, ''], message: 'can\'t be empty' }
  validates :cc_apply, exclusion: { in: [nil, ''], message: 'can\'t be empty' }

  def product_type
    product_name.gsub('_', ' ').capitalize
  end

  def login_entries(user)
    user.login_entries.where(payment: false).approved_login_entires.pluck(:customer_full_name, :id)
  end
end
