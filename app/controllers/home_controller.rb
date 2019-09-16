class HomeController < ApplicationController
  def index
    @users = Role.find_by(name: 'user').users.where(job_status: 'Active')
  end

  def employee_handbook
  end

  def employee_designation
  end

  def add_leave
    Role.where(name: 'user').first.users.each do |user|
      user.update(leave_bal: user.leave_bal+1, leave_added_on: Date.today)
    end
    current_user.update(leave_added_on: Date.today)
    redirect_to root_path
  end
end
