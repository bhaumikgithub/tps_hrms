class FreeLeavesController < ApplicationController
	include InheritAction

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
