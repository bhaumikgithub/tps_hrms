class Bill < ApplicationRecord
  belongs_to :vendor
  has_many_attached :files
  enum status: {
    Paid: 0,
    Unpaid: 1,
    Refunded: 2,
    Partially_Paid: 1
  }

  validates_presence_of :number, :bill_date, :discription, :amount, :vendor_id, :paid_amount, :paid_from, :paid_via, :paid_notes 
end
