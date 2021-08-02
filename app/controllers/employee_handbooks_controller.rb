class EmployeeHandbooksController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [:sort]
  skip_before_action :verify_authenticity_token, :only => [:sort]
  include InheritAction

  def index
    @resources = EmployeeHandbook.all.order('position ASC')
    respond_to do |format|
      format.html
      format.json { render json: @resources }
    end
  end

  def sort
    params[:employee_handbook].each_with_index do |id, index|
      EmployeeHandbook.where(id: id).update_all(position: index + 1)
    end

    head :ok
  end
end
