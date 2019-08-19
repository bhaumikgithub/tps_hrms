class Leave < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :approved_by,class_name: 'User', foreign_key: 'approved_by_id'

  # enum leave_type: [:full, :first_half, :second_half, :not_informed, :wfh]

  LEAVE_TYPES =  {"full" => '#0000FF', "first half" => '#000000', "second half" => '#000000', "not informed" => '#FF0000', 'wfh' => '#008000'}.freeze

  before_save :update_color

  def update_color
    self.color = Leave::LEAVE_TYPES[self.leave_type.downcase]
    true
  end


end
