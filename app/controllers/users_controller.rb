class UsersController < ApplicationController

  load_and_authorize_resource
  skip_authorize_resource :only => [:birthday_anniversary, :user_data, :recurring_user_data, :change_profile, :remove_profile, :show, :update, :create_education_detail, :edit_education_detail_modal, :update_education, :delete_education, :delete_designation]
  
  skip_before_action :verify_authenticity_token, :only => [:change_profile, :remove_profile]
  before_action :find_user, only: [:edit, :update, :destroy, :show, :change_profile, :remove_profile, :authenticate_user, :create_education_detail, :edit_education_detail_modal, :delete_education, :delete_designation]
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

  def edit_education_detail_modal
    @education = Education.find(params[:education_id])
  end

  def delete_education
    Education.find(params[:education_id]).destroy!
    redirect_to user_path(@user)
  end

  def delete_designation
    UserDesignation.find(params[:user_des_id]).destroy!
    redirect_to user_path(@user)
  end

  def update_education
    redirect_to user_path(current_user.id)
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
       events << {:id => user.id, :title => "#{user.full_name.humanize}", :start => user_anniversary ,:end => user_anniversary, color: '#0000FF' }
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
        events << {:id => user.id, :title => "#{user.full_name.humanize}", :start => user_anniversary+i.year ,:end => user_anniversary+i.year, color: '#0000FF' } if user_anniversary
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

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email, :comp_email, :emergency_contact, :contact, :birthday, :marital_status, :anniversary_date, :join_date, :job_status, :address, :degree_id, :experience, :designation_id, :mentor, :department_id, :adhar_no, :pan_no, :user_type, :profile_picture, :leave_bal,:leave_added_on, :emp_code, :gender, :role_id)
  end

  def education_params
    params.require(:education).permit(:degree_id, :college, :university, :from, :to, :is_current, :user_id)
  end

  def user_designation_params
    params.require(:user_designation).permit(:designation_id, :department_id, :mentor, :start_date, :end_date, :is_current, :user_id)
  end

  def user_password
    generated_password = Devise.friendly_token.first(8)
  end

  def find_user
    @user = User.find_by(id: params[:id]) || current_user
  end

  def authenticate_user
    if @user.id == current_user.id || current_user.role.name == 'admin'
    else
      redirect_to root_path
    end
  end
end
