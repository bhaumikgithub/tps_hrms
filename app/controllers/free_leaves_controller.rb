class FreeLeavesController < ApplicationController
	include InheritAction

  def create
    params[:free_leave][:leave_month] = resource_params[:leave_month].to_date.at_beginning_of_month
    if FreeLeave.exists?(user_id: params[:free_leave][:user_id], leave_month: params[:free_leave][:leave_month])
      redirect_to free_leaves_path, alert: 'You can not create same entry again'
    else
      @resource = resource_class.new(resource_params)
      if @resource.save
        if @resource.present? && @resource.leave_month == Date.today.at_beginning_of_month
          leave_count = @resource.user.leave_bal + @resource.extra_leave
          @resource.user.update(leave_bal: leave_count)
        end
      end
      redirect_to free_leaves_path
    end
  end

  def destroy
    if @resource.present? && @resource.leave_month == Date.today.at_beginning_of_month
      leave_count = @resource.user.leave_bal - @resource.extra_leave
      @resource.user.update(leave_bal: leave_count)
    end
    @resource.destroy
    redirect_to free_leaves_path
  end
	private

  def resource_class
    FreeLeave
  end

  def resource_name
    :free_leave
  end

  def resource_params
    params.require(:free_leave).permit(:extra_leave,:reason, :leave_month, :user_id)
  end
end
