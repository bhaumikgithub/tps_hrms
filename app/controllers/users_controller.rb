class UsersController < ApplicationController

  before_action :find_user, only: [:edit, :update, :destroy, :show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create_user
    password = user_password
    @user = User.new(user_params.merge(password: password))
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
      redirect_to users_path
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

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email, :comp_email, :emergency_contact, :contact, :birthday, :marital_status, :anniversary_date, :join_date, :job_status, :address, :degree, :experience, :designation, :mentor, :dept, :adhar_no, :pan_no, :user_type)
  end

  def user_password
    generated_password = Devise.friendly_token.first(8)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
