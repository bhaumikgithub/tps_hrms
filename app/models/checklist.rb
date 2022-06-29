class Checklist < ApplicationRecord
  has_many :checklist_items, inverse_of: :checklist, dependent: :destroy
  accepts_nested_attributes_for :checklist_items, reject_if: :all_blank, allow_destroy: true

  has_many :checklist_users,dependent: :destroy
  has_many :users, through: :checklist_users

  validates_presence_of :category
  validates :category, uniqueness: true

  enum status: {
    Active: 0,
    Deactive: 1
  }

  after_create :create_checklist_user

  def create_checklist_user
    User.all.each do |u|
      ChecklistUser.find_or_create_by(user_id: u.id, checklist_id: self.id)
    end
  end
end
