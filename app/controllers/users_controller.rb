class UsersController < ApplicationController

  before_action :find_user, only: [:edit, :update, :destroy, :show, :authenticate_user]
  before_action :authenticate_user, only:  [:destroy, :show, :update, :edit]

  def index
    @users = User.all
  end

  def new
    if  current_user.role.name == 'admin'
      @user = User.new
    else
      redirect_to root_path
    end
  end

  def create_user
    password = user_password
    role = Role.find_by_name('user')
    @user = User.new(user_params.merge(password: password, role_id: role.id))
    if @user.save
      UserMailer.new_registration(@user.email, password).deliver
      redirect_to users_path
    else
      puts @user.errors.inspect
      render :new
    end
  end


  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
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
    users = User.all
    events = []
    users.each do |user|
      user_birthday = user.birthday.present? ? Date.new(Date.today.year, user.birthday.try(:month), user.birthday.try(:day)) : user.birthday
      user_anniversary = user.anniversary_date.present? ? Date.new(Date.today.year, user.anniversary_date.try(:month), user.anniversary_date.try(:day)) : user.anniversary_date
      events << {:id => user.id, :title => "#{user.full_name.humanize}", :start => user_birthday ,:end => user_birthday,  color: '#008000' }
       events << {:id => user.id, :title => "#{user.full_name.humanize}", :start => user_anniversary ,:end => user_anniversary, color: '#0000FF' }
    end
    render :json => events.to_json
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email, :comp_email, :emergency_contact, :contact, :birthday, :marital_status, :anniversary_date, :join_date, :job_status, :address, :degree, :experience, :designation, :mentor, :dept, :adhar_no, :pan_no, :user_type, :profile_picture)
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
