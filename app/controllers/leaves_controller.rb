class LeavesController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [:index, :get_events, :request_leave, :get_mentor, :create, :leave_filter, :leave_preview, :cancelled_leave, :approved_leave, :my_leaves]
  include InheritAction
  
  def get_events
    if params[:user_id].present?
      user = User.find_by(id: params[:user_id].to_i)
      leaves = user.user_leaves.where.not(leave_type: "wfh").where(status: "approved")
    elsif params[:is_wfh] == 'true'
      leaves = Leave.all.where(status: "approved")
    else
      leaves = Leave.all.where.not(leave_type: "wfh").where(status: "approved")
    end
    events = []
    leaves.each do |leave|
      leave.leave_array[0].each do |date|
        events << {:id => leave.id, :title => "#{leave.user.full_name.humanize}", :start => date,:end => date, :color => leave.color }
      end
    end
    holidays = Holiday.all
    holidays.each do |holiday|
      events << {:id => holiday.id, :title => "#{holiday.holiday_name}", :start => "#{holiday.holiday_date&.to_date}",:end => "#{holiday.try(:holiday_date).try(:to_date)+1}", :color => '#fff8f8' }
    end
    render :json => events.to_json
  end

 def index
    @users = User.all.includes(:user_leaves)
    if current_user.admin?
      @resources = Leave.where("leave_date >= ? OR end_date >= ?", Date.today, Date.today ).order('created_at DESC')
    else
      @resources = Leave.joins(user: :user_designations).where('(leaves.leave_date >= ? OR leaves.end_date >= ?) and user_designations.mentor = ? and is_current = true', Date.today, Date.today, current_user.id.to_s).order('created_at DESC')
    end
    @user_leaves = {}
    User.all.each do |user|
      leave = user.user_month_leave(params[:month].to_i, params[:year].to_i)
      @user_leaves[user.full_name] = [user.id ,leave] if leave > 0
    end
  end

  def request_leave
    @resource = Leave.new
  end

  def leave_filter
    if params[:leave_type] == "Past"
      if current_user.admin?
        @resources = Leave.where("leave_date < (?)", Date.today).order('created_at DESC')
      else
        @resources = Leave.joins(user: :user_designations).where('leaves.leave_date < ? and user_designations.mentor = ? and is_current = true', Date.today, current_user.id.to_s).order('created_at DESC')
      end
    elsif params[:month].present?
      if current_user.admin?
        @resources = Leave.where('extract(month from leave_date) = (?) AND extract(year from leave_date) = (?) OR extract(month from end_date) = (?) AND extract(year from end_date) = (?) ' , params[:month], Date.today.year, params[:month], Date.today.year)
      else
        @resources = Leave.joins(user: :user_designations).where('(extract(month from leaves.leave_date) = (?) AND extract(year from  leaves.leave_date) = (?) OR extract(month from  leaves.end_date) = (?) AND extract(year from  leaves.end_date) = (?)) and user_designations.mentor = ? and is_current = true' , params[:month], Date.today.year, params[:month], Date.today.year, current_user.id.to_s)
      end
    elsif params[:leave_status].present?
      if current_user.admin?
        @resources = Leave.where("status IN (?)", params[:leave_status]).order('created_at DESC')
      else
        @resources = Leave.joins(user: :user_designations).where("leaves.status IN (?)", params[:leave_status]).where('user_designations.mentor = ? and is_current = true',current_user.id.to_s).order('created_at DESC')
      end
    else
      if current_user.admin?
        @resources = Leave.where("leave_date >= ? OR end_date >= ?", Date.today, Date.today ).order('created_at DESC')
      else
        @resources = Leave.joins(user: :user_designations).where('(leaves.leave_date >= ? OR leaves.end_date >= ?) and user_designations.mentor = ? and is_current = true', Date.today, Date.today, current_user.id.to_s).order('created_at DESC')
      end
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
    mentor = User.find_by(id: params[:emp_id])&.user_current_designation&.mentor
    render json: mentor
  end

  def leave_report
    start_month = Date.today.at_beginning_of_month
    @leave_reports = LeaveReport.all.where(start_month: start_month)
  end

  def leave_report_filter
    if  params[:month].present? && params[:year].present?
      select_date = Date.new(params[:year].to_i, params[:month].to_i)
      @leave_reports = LeaveReport.where(start_month: select_date)
    else
      @leave_reports = []
    end
  end

  def leave_preview
    @leave = Leave.find(params[:id])
  end

  def cancelled_leave
    @leave = Leave.find(params[:leave_id])
    if  @leave.approved_by_id == current_user.id ||  @leave.approved_by_id == current_user.id
      @leave.update(cancelled_reason: params[:cancelled_reason], cancelled_date: Date.today, status: "cancelled")
      redirect_to leaves_path
    else
      redirect_to leaves_path, alert: 'You are not authorized!'
    end
  end

  def approved_leave
    @leave = Leave.find(params[:id])
    if  @leave.approved_by_id == current_user.id ||  @leave.approved_by_id == current_user.id
      @leave.update(approved_date: Date.today, status: "approved")
      leaves = @leave.current_leave_count
      balance = @leave.user.leave_bal.to_f - leaves
      @leave.user.update(leave_bal: balance)
      redirect_to leaves_path
    else
      redirect_to leaves_path, alert: 'You are not authorized!'
    end
  end

  def my_leaves
  end

  private

  def resource_class
    Leave
  end

  def resource_name
    :leave
  end

  def resource_params
    params.require(:leave).permit(:leave_type,:leave_date, :approved_by_id, :user_id, :end_date, :status, :leave_reason, :duration_of_leave, :request_leave, :phone_availability, :emergency_contact, :availability_in_ahmd, :request_date, :approved_date, :cancelled_reason)
  end
end
