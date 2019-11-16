# frozen_string_literal: true

# require 'active_support/concern'
module InheritAction
  extend ActiveSupport::Concern

  included do
    before_action :fetch_resource, only: %i[show edit update destroy delete_category_with_products]
    before_action :remove_path_sessions, except: %i[new create edit update destroy]
    after_action :remove_path_sessions, only: %i[create update destroy] if @resource && !@resource.errors.any?
  end

  def index
    @resources = resource_class.all.order('created_at DESC').page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.json { render json: @resources }
    end
  end

  def new
    @resource = resource_class.new
  end

  def pre_creation_user
    @resource = resource_class.new(resource_params)
  end

  def create
    @resource = resource_class.new(resource_params)
    if @resource.save
      yield @resource if block_given?
      configure_redirect_path
    else
      puts @resource.errors.inspect
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    yield @resource if block_given?
    if @resource.update_attributes(resource_params)
      configure_redirect_path
    else
      render 'edit'
    end
  end

  def destroy
    @resource.destroy
    configure_redirect_path
  end

  def search
    @resources = resource_class.filter(class_search_params)
    yield @resources if block_given?
    render 'index'
  end

  private

  def fetch_resource
    @resource ||= resource_class.find(params[:id])
  end

  def resource_class
    resource_name.classify.constantize
  end

  def resource_params
    params.fetch(resource_name, {}).permit(permitted_attributes)
  end

  def permitted_attributes
    resource_class.column_names
  end

  def configure_redirect_path
    # if action_name == 'destroy' || (%w[trip_types tour_cost_types].include?(controller_name) && %w[create update].include?(action_name))
      redirect_to controller: controller_name, action: :index
    # else
      # redirect_to controller: controller_name, action: :show, id: @resource.id
    # end
  end

  def resource_name
    controller_name.singularize
  end

  def remove_path_sessions
    session.delete(:redirect_back) if session[:redirect_back].present?
  end
end
