
class UsersController < ApplicationController

  load_and_authorize_resource
  skip_authorize_resource :only => [:birthday_anniversary, :user_data, :recurring_user_data, :change_profile, :remove_profile, :create_education_detail, :edit_education_detail_modal, :edit_user_tracker_modal, :edit_user_type_modal, :update_user_type, :delete_type, :edit_user_designation_modal, :update_education, :update_user_designation, :delete_education, :delete_designation,:delete_tracker, :activation, :generate_designation_pdf, :edit_resign_model, :update_resign_user, :withdraw_resignation, :create_work_history, :edit_user_work_history, :delete_user_work_history]
  
  skip_before_action :verify_authenticity_token, :only => [:change_profile, :remove_profile, :create_user_checklist_item, :delete_user_checklist_item]
  before_action :find_user, only: [:activation, :edit, :update, :destroy, :show, :change_profile, :remove_profile, :authenticate_user, :create_education_detail, :edit_education_detail_modal, :edit_user_designation_modal, :edit_user_type_modal, :delete_type, :edit_user_tracker_modal, :delete_education, :delete_designation,:delete_tracker, :generate_designation_pdf, :edit_resign_model, :withdraw_resignation, :create_work_history, :edit_user_work_history, :delete_user_work_history]
  before_action :find_education_user, only: [:update_education]
  before_action :find_education, only: [:update_education]
  before_action :find_designation_user, only: [:update_user_designation]
  before_action :find_type_user, only: [:update_user_type]
  before_action :find_designation, only: [:update_user_designation]
  before_action :find_tracker_user, only: [:update_user_tracker]
  before_action :find_tracker, only: [:update_user_tracker]
  before_action :find_user_work_history, only: [:update_user_work_history]
  before_action :authenticate_user, only:  [:destroy, :update, :edit]

  def index
    @users = User.all.where(job_status: 'Active').order('first_name ASC')
  end

  def new
    if  current_user.role.name == 'admin'
      @user = User.new
    else
      redirect_to root_path
    end
  end

  def show
    @educations = @user.educations
    @user_designations = @user.user_designations
    @user_types = @user.user_types
    @user_type_history = @user.audits.reverse
    @work_histories = @user.work_histories
    @checklists = Checklist.joins(:checklist_items, users: :checklist_users).where(checklist_users: {user_id: @user.id}).where(status: 'Active').group('checklists.id').order('position ASC')

    @start_date = Date.today.at_beginning_of_month
    @end_date = Date.today.at_end_of_month

    @taken_leave = User.current_month_leave(@user, @start_date).to_i
    @free_leave = @user.free_leaves.find_by_leave_month(@start_date).to_i + 1
    @prev_leave_bal = @user.leave_reports.find_by_start_month(@start_date.at_beginning_of_month - 1.month).try(:current_leave_bal).to_i
    @trackers = @user.trackers
  end

  def create_user
    password = user_password
    role = Role.find_by_name('user')
    @user = User.new(user_params.merge(password: password, role_id: role.id))
    if @user.save
      UserMailer.new_registration(@user.comp_email, password).deliver
      redirect_to users_path
    else
      puts @user.errors.inspect
      render :new
    end
  end

  def create_education_detail
    @education = Education.new(education_params)
    if @education.save
      redirect_to user_path(@user)
    else
      puts @education.errors.inspect
      redirect_to user_path(@user)
    end
  end

  def create_work_history
    @work_history = WorkHistory.new(work_history_params)
    if @work_history.save
      redirect_to user_path(@user)
    else
      puts @work_history.errors.inspect
      redirect_to user_path(@user)
    end
  end

  def create_user_designation
    @user_designation = UserDesignation.new(user_designation_params)
    if @user_designation.save
      if user_designation_params[:is_current].present?
        @user.update(mentor: user_designation_params[:mentor]) if user_designation_params[:mentor].present?
      end
      redirect_to user_path(@user)
    else
      puts @user_designation.errors.inspect
      redirect_to user_path(@user)
    end
  end
  
  def create_tracker
    @tracker = Tracker.new(user_tracker_params)
    if @tracker.save
      redirect_to user_path(@user)
    else
      puts @tracker.errors.inspect
      redirect_to user_path(@user)
    end
  end


  def create_user_type
    @user_type = UserType.new(user_type_params)
    if @user_type.save
      if user_type_params[:is_current].present?
        @user.update(user_type: user_type_params[:employee_type]) if user_type_params[:employee_type].present?
      end
      redirect_to user_path(@user)
    else
      puts @user_type.errors.inspect
      redirect_to user_path(@user)
    end
  end

  def edit_education_detail_modal
    @education = Education.find(params[:education_id])
  end

  def delete_education
    Education.find(params[:education_id]).destroy!
    redirect_to user_path(@user)
  end

  def delete_user_work_history
    WorkHistory.find(params[:work_history_id]).destroy!
    redirect_to user_path(@user)
  end

  def edit_user_work_history
    @work_history = WorkHistory.find(params[:work_history_id])
  end

  def delete_designation
    UserDesignation.find(params[:user_des_id]).destroy!
    redirect_to user_path(@user)
  end
  def delete_tracker
    Tracker.find(params[:tracker_id]).destroy!
    redirect_to user_path(@user)
  end

  def delete_type
    UserType.find(params[:user_type_id]).destroy!
    redirect_to user_path(@user)
  end

  def update_education
    if @education.update(education_params)
      redirect_to user_path(@user)
    else
      redirect_to user_path(@user), alert: 'Something went wrong!'
    end
  end

  def update_user_work_history
    if @work_history.update(work_history_params)
      redirect_to user_path(@user)
    else
      redirect_to user_path(@user), alert: 'Something went wrong!'
    end
  end

  def edit_user_designation_modal
    @user_designation = UserDesignation.find(params[:user_designation_id])
  end
  def edit_user_tracker_modal
    @tracker = Tracker.find(params[:tracker_id])
  end

  def update_user_designation
    if @user_designation.update(user_designation_params)
      redirect_to user_path(@user)
    else
      redirect_to user_path(@user), alert: 'Something went wrong!'
    end
  end

  def edit_user_type_modal
    @user_type = UserType.find(params[:user_type_id])
  end

  def update_user_type
    @user_type = UserType.find_by(id: params[:user_type_id])
    if @user_type.update(user_type_params)
      if user_type_params[:is_current].present?
        @user.update(user_type: user_type_params[:employee_type]) if user_type_params[:employee_type].present?
      end
      redirect_to user_path(@user)
    else
      redirect_to user_path(@user), alert: 'Something went wrong!'
    end
  end

  def update_user_tracker
    # @tracker= Tracker.update(user_tracker_params)
    if @tracker.update(user_tracker_params)
      redirect_to user_path(@user)
    else
      redirect_to user_path(@user), alert: 'Something went wrong!'
    end
  end

  def edit_resign_model
  end

  def update_resign_user
    @user = User.find(params[:user][:user_id])
    if @user.update(user_params)
      @user_des = @user.user_designations.order(:id).last
      if @user_des.present? && @user_des.is_current?
        @user_des.update(is_current: false, end_date: @user.resign_date)
      end
      redirect_to user_path(@user)
    else
      redirect_to user_path(@user), alert: 'Something went wrong!'
    end
  end

  def withdraw_resignation
    @user.update(job_status: "Active")
    redirect_to user_path(@user)
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  def change_profile
    data = params[:profile_picture]
    @original_filename = "profile_picture.jpg"
    if data.present?
      image_data = Base64.decode64(data['data:image/jpeg;base64,'.length .. -1]) if data.include?("data:image/jpeg;base64")
      new_file=File.new("public/images/#{@original_filename}", 'wb')
      new_file.write(image_data)
      @user.profile_picture.attach(io: File.open("public/images/#{@original_filename}"), filename: 'profile_picture.jpg', content_type: 'application/jpg')
      File.delete("public/images/#{@original_filename}")
    end
    head :ok
  end

  def remove_profile
    @user.profile_picture.purge
    redirect_to user_path(@user)
  end

  def destroy
    if @user
      @user.destroy
    end
    redirect_to users_path
  end

  def birthday_anniversary
  end

  def user_data
    users = User.all.where(job_status: 'Active')
    events = []
    users.each do |user|
      user_birthday = user.birthday.present? ? Date.new(Date.today.year, user.birthday.try(:month), user.birthday.try(:day)) : user.birthday
      user_anniversary = user.anniversary_date.present? ? Date.new(Date.today.year, user.anniversary_date.try(:month), user.anniversary_date.try(:day)) : user.anniversary_date
      events << {:id => user.id, :title => "#{user.full_name.humanize}", :start => user_birthday ,:end => user_birthday,  color: '#008000', repeat: 2 }
       events << {:id => user.id, :title => "#{user.full_name.humanize}", :start => user_anniversary ,:end => user_anniversary, color: '#3a8bc5' }
    end
    render :json => events.to_json
  end

  def recurring_user_data
    users = User.all.where(job_status: 'Active')
    events = []
    users.each do |user|
      user_birthday = user.birthday.present? ? Date.new(Date.today.year, user.birthday.try(:month), user.birthday.try(:day)) : user.birthday
      user_anniversary = user.anniversary_date.present? ? Date.new(Date.today.year, user.anniversary_date.try(:month), user.anniversary_date.try(:day)) : user.anniversary_date
      for i in 1..50 do
        events << {:id => user.id, :title => "#{user.full_name.humanize}", :start => user_birthday+i.year ,:end => user_birthday+i.year,  color: '#008000' } if user_birthday
        events << {:id => user.id, :title => "#{user.full_name.humanize}", :start => user_anniversary+i.year ,:end => user_anniversary+i.year, color: '#3a8bc5' } if user_anniversary
      end
    end
    render :json => events.to_json
  end

  def job_status_filter
    if params[:job_status].present?
      @users = User.all.where(job_status: params[:job_status]).order('first_name ASC')
    else
      @users = User.all.where(job_status: 'Active').order('first_name ASC')
    end
  end

  def activation
    @user.update(job_status: params[:job_status]) if params[:job_status].present?
    redirect_to users_path
  end

  def generate_designation_pdf
    @user_designation = UserDesignation.find(params[:designation_id])
    @start_date = @user_designation.start_date
    @user_prev_des = @user.user_designations.where("start_date < ?", @start_date).order(start_date: :desc).first
    respond_to do |format|
      format.html
      format.pdf do
          render pdf: "Designation_PDF",
          page_size: 'A4',
          template: "users/generate_designation_pdf.html.erb",
          layout: "pdf.html",
          lowquality: true,
          zoom: 1,
          dpi: 75
      end
    end
  end

  def create_user_checklist_item
    if ActiveModel::Type::Boolean.new.cast(params[:has_checked])
      @checklist_item_users = ChecklistItemUser.where(user_id: params[:id], checklist_item_id: params[:checklist_item_id]).first_or_create
      if @checklist_item_users.save
        render json: @checklist_item_users
      else
        render json: "Something went wrong"
      end
    else
      @checklist_item_users = ChecklistItemUser.where(user_id: params[:id], checklist_item_id: params[:checklist_item_id])
      if @checklist_item_users.present?
        @checklist_item_users.destroy_all
      end
      render json: "Checklist item deleted"
    end
  end


  def delete_user_checklist_item
    @checklist_user = ChecklistUser.find_by(checklist_id: params[:checklist_id], user_id: params[:id] )
    if @checklist_user.present?
        @checklist_user.destroy
    end
    render json: "Checklist deleted"
  end
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email, :comp_email, :emergency_contact, :contact, :birthday, :marital_status, :anniversary_date, :join_date, :job_status, :address, :degree_id, :experience, :designation_id, :mentor, :department_id, :adhar_no, :pan_no, :user_type, :profile_picture, :leave_bal,:leave_added_on, :emp_code, :gender, :role_id, :is_event_manager, :resign_date, :resign_reason)
  end

  def education_params
    params.require(:education).permit(:degree_id, :college, :university, :from, :to, :is_current, :user_id)
  end

  def work_history_params
    params.require(:work_history).permit(:year, :mentor, :peer, :team_member, :user_id)
  end

  def user_designation_params
    params.require(:user_designation).permit(:designation_id, :department_id, :mentor, :start_date, :end_date, :is_current, :user_id)
  end
  def user_tracker_params
    params.require(:tracker).permit(:user_id, :project_name, :tracker_name,:start_date,:end_date,:is_current, :no_tracker)
  end

  def user_type_params
    params.require(:user_type).permit(:employee_type, :start_date, :end_date, :is_current, :user_id)
  end

  def user_password
    generated_password = Devise.friendly_token.first(8)
  end

  def find_user
    @user = User.find_by(id: params[:id]) || current_user
  end

  def find_education_user
    @user = User.find_by(id: education_params[:user_id]) || current_user
  end

  def find_education
    @education = Education.find_by(id: params[:education_id])
  end

  def find_designation_user
    @user = User.find_by(id: user_designation_params[:user_id]) || current_user
  end
  def find_tracker_user
    @user = User.find_by(id: user_tracker_params[:user_id]) || current_user
  end

  def find_type_user
    @user = User.find_by(id: user_type_params[:user_id]) || current_user
  end

  def find_designation
    @user_designation = UserDesignation.find_by(id: params[:user_designation_id])
  end
  def find_tracker
    @tracker = Tracker.find_by(id:  params[:tracker][:tracker_id])
    puts "running ..........#{params[:tracker_id]}"
  end
  def find_user_work_history
    @user = User.find_by(id: work_history_params[:user_id]) || current_user
    @work_history = WorkHistory.find_by(id: params[:work_history_id])
  end 

  def authenticate_user
    if @user.id == current_user.id || current_user.role.name == 'admin' || (can? :manage, User)
    else
      redirect_to root_path
    end
  end
end
