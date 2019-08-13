class LeavesController < ApplicationController
  include InheritAction

  private

  def resource_class
    Leave
  end

  def resource_name
    :leave
  end

  def resource_params
    params.require(:leave).permit(:leave_type,:date, :approved_by, :user_id)
  end
end
