class HolidaysController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [:holiday_filter]
  include InheritAction
   def index
    start_date = Date.new(Date.today.year.to_i, 1, 1)
    end_date =  Date.new(Date.today.year.to_i.to_i, 12, 31)
    @resources = Holiday.where("holiday_date BETWEEN ? AND ?", start_date,  end_date).order('holiday_date ASC').page(params[:page]).per(10)
    # @resources = resource_class.all.where("holiday_date >= ?", Date.today).order('holiday_date ASC').page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.json { render json: @resources }
    end

  def holiday_filter
    puts "=@params====#{params.inspect}===="
    if params[:leave_type].present?
      if params[:leave_type] == "Past"
        @resources = Holiday.where("holiday_date < (?)", Date.today).order('holiday_date ASC')
      else
        @resources = Holiday.where("holiday_date >= ?", Date.today ).order('holiday_date ASC')
      end
    end
    if params[:year].present?
      start_date = Date.new(params[:year].to_i, 1, 1)
      end_date =  Date.new(params[:year].to_i, 12, 31)
      @resources = Holiday.where("holiday_date BETWEEN ? AND ?", start_date,  end_date).order('holiday_date ASC')

    end

     puts"@resources======#{@resources.inspect}========"
   end
  end
end
