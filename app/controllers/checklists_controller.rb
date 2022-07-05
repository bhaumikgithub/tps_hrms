class ChecklistsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [:sort]
  skip_before_action :verify_authenticity_token, :only => [:sort]
  include InheritAction

  def index
    @resources = Checklist.all.order('position ASC')
    respond_to do |format|
      format.html
      format.json { render json: @resources }
    end
  end

  def sort
    if current_user.admin?
      params[:checklist].each_with_index do |id, index|
        Checklist.where(id: id).update_all(position: index + 1)
      end
    end
    head :ok
  end

  private

  def resource_params
    params.require(:checklist).permit(:category, :status, checklist_items_attributes: [:id, :name, :_destroy])
  end
end
