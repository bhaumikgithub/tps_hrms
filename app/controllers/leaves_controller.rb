class LeavesController < ApplicationController
  include InheritAction

  def get_events
    leaves = Leave.all
    events = []
    leaves.each do |leave|
      events << {:id => leave.id, :title => "#{leave.user.full_name.humanize}", :start => "#{leave.leave_date&.to_date}",:end => "#{leave.try(:end_date).try(:to_date)+1}", :color => leave.color }
    end
    holidays = Holiday.all
    holidays.each do |holiday|
      events << {:id => holiday.id, :title => "#{holiday.holiday_name}", :start => "#{holiday.holiday_date&.to_date}",:end => "#{holiday.try(:holiday_date).try(:to_date)+1}", :color => '#ff69b4' }
    end
    render :json => events.to_json
  end

  private

  def resource_class
    Leave
  end

  def resource_name
    :leave
  end

  def resource_params
    params.require(:leave).permit(:leave_type,:leave_date, :approved_by_id, :user_id, :end_date)
  end
end
