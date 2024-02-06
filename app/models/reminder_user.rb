class ReminderUser < ApplicationRecord
  belongs_to :reminder
  belongs_to :assigned_to_user, :class_name => 'User'
end
