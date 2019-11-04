class RolesController < ApplicationController
  include InheritAction

  def create
		params[:role][:name] = resource_params[:name].titleize.gsub(" ","").underscore
		@resource = Role.new(resource_params)
		if @resource.save
			redirect_to roles_path
		else
			puts @resource.errors.inspect
			render 'new'
		end
  end

  private

  def resource_params
    params.require(:role).permit(:name)
  end
end
