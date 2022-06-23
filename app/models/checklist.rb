class Checklist < ApplicationRecord
  has_many :checklist_items, inverse_of: :checklist, dependent: :destroy
  accepts_nested_attributes_for :checklist_items, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :category
  validates :category, uniqueness: true

  enum status: {
    Active: 0,
    Deactive: 1
  }
end
