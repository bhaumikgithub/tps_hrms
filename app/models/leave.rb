class Leave < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :approved_by,class_name: 'User', foreign_key: 'approved_by_id'

  # enum leave_type: [:full, :first_half, :second_half, :not_informed, :wfh]
  LEAVE_STATUS = ["pending", "approved"]
  LEAVE_TYPES =  {"full" => '#0000FF', "first half" => '#000000', "second half" => '#000000', "not informed" => '#FF0000', 'wfh' => '#008000'}.freeze

  before_save :update_color

  def update_color
    self.color = Leave::LEAVE_TYPES[self.leave_type.downcase]
    true
  end


  def holiday_leave
    ((self.leave_date.to_date..self.end_date.to_date).to_a & Holiday.pluck(:holiday_date).map(&:to_date))
  end

  def leave_array
    if (self.leave_date.to_date..self.end_date.to_date).count < 10
      ((self.leave_date.to_date..self.end_date.to_date).map { |e| e unless [0,6].include? e.wday  } - holiday_leave).reject { |e| e.to_s.empty? }
    else
      (self.leave_date.to_date..self.end_date.to_date)
    end
  end


end
