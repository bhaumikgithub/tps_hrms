class LeaveReport < ApplicationRecord
  belongs_to :user

  # before_destroy  :update_free_leave_balance

  # def update_free_leave_balance
  # 	self.user.update(leave_bal: self.prev_month_leave_bal+1)
  # end
end
