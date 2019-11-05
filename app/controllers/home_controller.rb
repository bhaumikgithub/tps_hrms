class HomeController < ApplicationController
  
  def index
    @users = Role.find_by(name: 'user').users.where(job_status: 'Active')
    @leaves = Leave.where('leave_date >= ? and leave_date <= ?', Date.today, Date.today + 7.days).order('leave_date ASC')
    @employees_leaves = Leave.joins(:user).where('leave_date >= ? and leave_date <= ? and mentor = ? ', Date.today, Date.today + 14.days, current_user.id.to_s)
    @employees_leaves += current_user.user_leaves.where('leave_date >= ? and leave_date <= ?', Date.today, Date.today + 7.days).order('leave_date ASC')
  end

  def employee_handbook
  end

  def employee_designation
    @departments = Department.all.includes(:users)
  end

  def add_leave
    Role.where(name: 'user').first.users.each do |user|
      leave_bal = user.leave_bal.present? ? user.leave_bal + 1 : 0
      user.update(leave_bal: leave_bal, leave_added_on: Date.today)
    end
    current_user.leave_added_on = Date.today
    current_user.save(validate: false)
    redirect_to root_path
  end
end
