class ContactsController < ApplicationController
  
  def new
  end

  def create
    c = SuggestionForm.new(:name => current_user.full_name, :email => current_user.email,comments: params[:comment], title: params[:title], file: params[:file])
    if c.valid?
      c.deliver
      redirect_to root_path, notice: "Thanks for your suggestions." 
    else
      redirect_to root_path, alert: "Something went wrong! Please verify your email."
    end
  end
end
