class DocumentsController < ApplicationController

  # load_and_authorize_resource
  include InheritAction
  before_action :find_document, only: [:destroy]

  def create
    @resource = resource_class.new(resource_params)
    if @resource.save
      yield @resource if block_given?
    else
      puts @resource.errors.inspect
    end
    redirect_to user_path(resource_params[:user_id])
  end

  def destroy
    if @document
      @document.destroy
    end
    redirect_to user_path(params[:user_id])
  end

  private
  def resource_class
    Document
  end

  def resource_name
    :document
  end

  def resource_params
    params.require(:document).permit(:name, :document, :user_id)
  end

  def find_document
    @document = Document.find_by(id: params[:id])
  end
end
