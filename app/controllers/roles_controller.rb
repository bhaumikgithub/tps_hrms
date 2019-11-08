class RolesController < ApplicationController
  include InheritAction

  def index
    @resources = resource_class.all.order('name ASC').page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.json { render json: @resources }
    end
  end

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
