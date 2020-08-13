class RolesController < ApplicationController
  # skip_authorize_resource :only => [:create_permission]
  skip_before_action :verify_authenticity_token, :only => [:create_permission]

  include InheritAction

  def index
    @resources = resource_class.all.order('name ASC')
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

  def add_permission
    @role_permission = RolePermission.new
    @role = Role.find(params[:id])
    @permissions = Permission.order(:subject_class).pluck(:subject_class).uniq
  end

  def create_permission
    if ActiveModel::Type::Boolean.new.cast(params[:has_permission])
      @role_permission = RolePermission.where(role_id: params[:id], permission_id: params[:permission_id]).first_or_create
      if @role_permission.save
        render json: @role_permission
      else
        render json: "Something went wrong"
      end
    else
      @role_permission = RolePermission.where(role_id: params[:id], permission_id: params[:permission_id])
      if @role_permission.present?
        @role_permission.destroy_all
      end
      render json: "Role permission deleted"
    end
  end

  private

  def resource_params
    params.require(:role).permit(:name)
  end
end
