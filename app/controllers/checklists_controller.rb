class ChecklistsController < ApplicationController
  load_and_authorize_resource
  include InheritAction

  private

  def resource_params
    params.require(:checklist).permit(:category, :status, checklist_items_attributes: [:id, :name, :_destroy])
  end
end
