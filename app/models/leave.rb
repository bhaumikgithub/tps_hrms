class Leave < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :approved_by,class_name: 'User', foreign_key: 'approved_by_id'

  # enum leave_type: [:full, :first_half, :second_half, :not_informed, :wfh]
  LEAVE_STATUS = ["approved", "pending", "cancelled"]
  LEAVE_TYPES =  {"full day" => '#3a8bc5', "first half" => '#000000', "second half" => '#000000', "not informed" => '#FF0000', 'wfh' => '#008000'}.freeze

  before_save     :update_color
  # after_create    :update_leave_balance
  # before_destroy  :add_leave_balance

  validates_presence_of :leave_date, :end_date



  def update_color
    self.color = Leave::LEAVE_TYPES[self.leave_type.downcase]
    true
  end


  def holiday_leave
    ((self.leave_date.to_date..self.end_date.to_date).to_a & Holiday.pluck(:holiday_date).map(&:to_date))
  end

  def leave_array
    if (self.leave_date.to_date..self.end_date.to_date).count < 10
      [((self.leave_date.to_date..self.end_date.to_date).map { |e| e unless [0,6].include? e.wday  } - holiday_leave).reject { |e| e.to_s.empty? }, leave_index]
    elsif (self.leave_date.to_date..self.end_date.to_date).count > 10 && self.leave_type == "wfh"
      [((self.leave_date.to_date..self.end_date.to_date).map { |e| e unless [0,6].include? e.wday  } - holiday_leave).reject { |e| e.to_s.empty? }, leave_index]
    else
      [(self.leave_date.to_date..self.end_date.to_date), leave_index]
    end
  end

  def shorten_leave
    start_date = self.leave_date.to_date
    end_date = self.end_date.to_date
    if start_date.strftime("%b") == end_date.strftime("%b")
      same_leave_month(start_date, end_date)
    else
      diff_leave_month(start_date, end_date)
    end
  end

  def same_leave_month(start_date, end_date)
    if (start_date..end_date).count == 1
      start_date.strftime("%d %b")
    elsif (start_date..end_date).count == 2
      start_date.strftime("%d") + " & " + end_date.strftime("%d %b")
    else
      start_date.strftime("%d") + " to " + end_date.strftime("%d %b")
    end
  end

  def diff_leave_month(start_date, end_date)
    if (start_date..end_date).count == 2
      start_date.strftime("%d %b") + " & " + end_date.strftime("%d %b")
    else
      start_date.strftime("%d %b") + " to " + end_date.strftime("%d %b")
    end
  end

  def leave_index
    if ['full day', 'not informed'].include? self.leave_type
      1
    elsif ['first half', 'second half'].include? self.leave_type
      0.5
    else
      0
    end  
  end

  def current_leave_count
    count = 0
    leave_array[0].map {|leave_date| leave_date.strftime("%b") == Date.today.strftime("%b") ? count = count + leave_array[1] : ""}
    return count
  end

  def total_leave_count(avail_date)
    count = 0
    leave_array[0].map {|leave_date| leave_date.strftime("%b") == avail_date.strftime("%b") ? count = count + leave_array[1] : ""}
    return count
  end

  # def update_leave_balance
  #   # leaves = current_leave_count*self.leave_array[1]
  #   leaves = current_leave_count
  #   balance = self.user.leave_bal.to_f - leaves
  #   self.user.update(leave_bal: balance)
  # end

  # def add_leave_balance
  #   # leaves = current_leave_count*self.leave_array[1]
  #   leaves = current_leave_count
  #   balance = (self.user.leave_bal.present? ? self.user.leave_bal : 0) + leaves 
  #   self.user.update(leave_bal: balance)
  # end
end
