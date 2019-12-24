class LeavesController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [:index, :get_events]
  include InheritAction
  
  def get_events
    if params[:user_id].present?
      user = User.find_by(id: params[:user_id].to_i)
      leaves = user.user_leaves
    else
      leaves = Leave.all
    end
    events = []
    leaves.each do |leave|
      leave.leave_array[0].each do |date|
        events << {:id => leave.id, :title => "#{leave.user.full_name.humanize}", :start => date,:end => date, :color => leave.color }
      end
    end
    holidays = Holiday.all
    holidays.each do |holiday|
      events << {:id => holiday.id, :title => "#{holiday.holiday_name}", :start => "#{holiday.holiday_date&.to_date}",:end => "#{holiday.try(:holiday_date).try(:to_date)+1}", :color => '#ff69b4' }
    end
    render :json => events.to_json
  end

 def index
    @users = User.all.includes(:user_leaves)
    @resources = Leave.where("leave_date >= ? OR end_date >= ?", Date.today, Date.today ).order('created_at DESC')
    @user_leaves = {}
    User.all.each do |user|
      leave = user.user_month_leave(params[:month].to_i, params[:year].to_i)
      @user_leaves[user.full_name] = [user.id ,leave] if leave > 0
    end
  end

  def leave_filter
    if params[:leave_type] == "Past"
      @resources = Leave.where("leave_date < (?)", Date.today).order('created_at DESC')
    elsif params[:month].present?
      @resources = Leave.where('extract(month from leave_date) = (?) AND extract(year from leave_date) = (?) OR extract(month from end_date) = (?) AND extract(year from end_date) = (?) ' , params[:month], Date.today.year, params[:month], Date.today.year)
    else
      @resources = Leave.where("leave_date >= ? OR end_date >= ?", Date.today, Date.today ).order('created_at DESC')
    end
  end

  def create
    if Leave.exists?(user_id: params[:leave][:user_id], leave_date: params[:leave][:leave_date], end_date: params[:leave][:end_date])
      if(resource_params[:leave_type] == "wfh")
        if Leave.exists?(user_id: params[:leave][:user_id], leave_date: params[:leave][:leave_date], end_date: params[:leave][:end_date], leave_type: "wfh")
          redirect_to leaves_path , alert: 'You can not create same entry again'
        else
          super
        end
      else
        redirect_to leaves_path , alert: 'You can not create same entry again'
      end
    else
      super
    end
  end

  def get_user_leaves
  end

  def get_mentor
    mentor = User.find_by(id: params[:emp_id]).mentor
    render json: mentor
  end

  private

  def resource_class
    Leave
  end

  def resource_name
    :leave
  end

  def resource_params
    params.require(:leave).permit(:leave_type,:leave_date, :approved_by_id, :user_id, :end_date, :status)
  end
end
