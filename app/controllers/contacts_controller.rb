class ContactsController < ApplicationController
  
  def new
  end

  def create
    c = SuggestionForm.new(:name => current_user.full_name, :email => current_user.email,comments: params[:comment], title: params[:title])
    if c.valid?
      c.deliver
      redirect_to root_url notice: "Thank you for suggestions"    
    end
  end
end