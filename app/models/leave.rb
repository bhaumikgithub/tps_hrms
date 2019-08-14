class Leave < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :approved_by,class_name: 'User', foreign_key: 'approved_by_id'

  # enum leave_type: [:full, :first_half, :second_half, :not_informed, :wfh]

  LEAVE_TYPES =  ["full", "first half", "second half", "not informed", 'wfh'].freeze


end
