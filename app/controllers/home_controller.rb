class HomeController < ApplicationController
  def index
    @users = Role.find_by(name: 'user').users.where(job_status: 'Active')
  end

  def employee_handbook
  end
end
