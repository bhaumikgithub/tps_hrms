class Reminder < ApplicationRecord
	belongs_to :user, :class_name => 'User'
	has_many :reminder_users
	has_many :assigned_to_users, :class_name => 'User', through: :reminder_users, dependent: :destroy
  enum status: {
    Upcoming: 0,
    Completed: 1
  }
  validates_presence_of :reminder_date_time, :content, :assigned_to_user_ids, :title
end
