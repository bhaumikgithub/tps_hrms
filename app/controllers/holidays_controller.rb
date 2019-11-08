class HolidaysController < ApplicationController
  include InheritAction

   def index
    @resources = resource_class.all.order('holiday_date DESC').page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.json { render json: @resources }
    end
  end
end
