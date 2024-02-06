class RemindersController < ApplicationController
  include InheritAction

  def index
  	@resources = current_user.reminders.all.order('created_at DESC')
  end

  def create
  	params[:reminder][:reminder_date_time] = params[:reminder][:reminder_date_time] + ", " + Time.now.strftime("%H:%M:%S") if params[:reminder][:reminder_date_time].present?
  	super
  end

  def update
  	params[:reminder][:reminder_date_time] = params[:reminder][:reminder_date_time] + ", " + Time.now.strftime("%H:%M:%S") if params[:reminder][:reminder_date_time].present?
  	super
  end

  def mark_completed
  	@resource = Reminder.find_by(id: params[:id])
  	if @resource.status == 'Upcoming'
  		@resource.update(status: 'Completed')
  	end
  	redirect_to reminders_path
  end

  private

  def resource_params
    params.require(:reminder).permit(:reminder_date_time ,:content ,:status ,:user_id, :title , assigned_to_user_ids: [])
  end
end
