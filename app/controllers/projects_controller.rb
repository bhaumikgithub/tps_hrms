class ProjectsController < ApplicationController

  include InheritAction
  

  private

  def resource_params
    params.require(:project).permit(:name ,:description ,:department_id ,:manager ,:client_name ,:start_date ,:end_date ,:status, user_ids: [])
  end

end
