class EventManagementsController < ApplicationController
  before_action :fetch_session, only: %i[edit_session update_session delete_session]
  def index
  	@arrange_sessions = ArrangeSession.all.order(date: :desc)
  end

  def add_session
  	if current_user.is_event_manager? || current_user.admin?
  	  @arrange_session = ArrangeSession.new
  	else
  	  redirect_to event_managements_path , alert: 'You are not authorized!'
  	end
  end

  def create_session
  	@arrange_session = ArrangeSession.new(arrange_session_params)
  	if @arrange_session.save
      redirect_to event_managements_path
    else
      puts @arrange_session.errors.inspect
      render :add_session
    end
  end

  def edit_session
  	if current_user.is_event_manager? || current_user.admin?
  	else
  	  redirect_to event_managements_path , alert: 'You are not authorized!'
  	end
  end

  def update_session
  	if @arrange_session.update_attributes(arrange_session_params)
      redirect_to event_managements_path
    else
      puts @arrange_session.errors.inspect
      render 'edit_session'
    end
  end

  def delete_session
  	@arrange_session.destroy
    redirect_to event_managements_path
  end

  private

  def self.permission
    return "ArrangeSession"
  end

  def arrange_session_params
    params.require(:arrange_session).permit(:topic, :description, :date, :timing, :speaker, :user_id, :place, :applicants)
  end

  def fetch_session
    @arrange_session ||= ArrangeSession.find(params[:id])
  end
end
