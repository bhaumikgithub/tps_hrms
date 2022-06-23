class ChecklistItem < ApplicationRecord
  belongs_to :checklist
  has_many :checklist_item_users,dependent: :destroy
  has_many :users, through: :checklist_item_users

  validates_presence_of :name
  validates :name, uniqueness: true
end
