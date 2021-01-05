class ProjectsController < ApplicationController
  load_and_authorize_resource
  include InheritAction
  before_action :find_project, only: [:update]

  def create
    @resource = Project.new(resource_params)
    if @resource.save
      if @resource&.end_date.present? && @resource.end_date <= Date.today
        @resource.update(status: "Completed")
      end
      redirect_to projects_path
    else
      puts @resource.errors.inspect
      render 'new'
    end
  end

  def update
    if @resource.update_attributes(resource_params)
      if @resource&.end_date.present? && @resource.end_date <= Date.today
        @resource.update(status: "Completed")
      end
      redirect_to projects_path
    else
      render 'edit'
    end
  end

  private

  def resource_params
    params.require(:project).permit(:name ,:description ,:department_id ,:manager ,:client_name ,:start_date ,:end_date ,:status, user_ids: [])
  end

  def find_project
    @resource = Project.find_by(id: params[:id])
  end

end
