class EventLinksController < ApplicationController
  load_and_authorize_resource
  include InheritAction
  def index
    @resources = resource_class.all.order('created_at DESC')
    respond_to do |format|
      format.html
      format.json { render json: @resources }
    end
  end
end
