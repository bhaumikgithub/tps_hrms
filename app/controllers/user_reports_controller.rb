class UserReportsController < ApplicationController

  include InheritAction

  def create
     @resource = resource_class.new(resource_params)
    if @resource.save
      yield @resource if block_given?
      redirect_to user_report_path(@resource)
    else
      puts @resource.errors.inspect
      render 'new'
    end
  end

  private

  def resource_params
    params.require(:user_report).permit(:start_time ,:end_time ,:date, :project_member_id,:total_hours, :detail)
  end

end
