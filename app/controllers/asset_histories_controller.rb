class AssetHistoriesController < ApplicationController
  load_and_authorize_resource
  include InheritAction

  before_action :find_asset_history, only: [:update, :destroy]

  def create
     @resource = resource_class.new(resource_params)
    if @resource.save
      yield @resource if block_given?
      redirect_to asset_path(@resource.asset_id)
    else
      puts @resource.errors.inspect
      render 'new'
    end
  end

  def update
    if @resource.update(resource_params)
      redirect_to asset_path(@resource.asset_id)
    else
      render :edit
    end
  end

  def destroy
    if @resource
      @resource.destroy
    end
    redirect_to asset_path(@resource.asset_id)
  end


  def filter_date
    if params[:asset_id].present?
      if params[:asset_history_id].present?
        asset_histories = AssetHistory.where.not(id: params[:asset_history_id]).where(asset_id: params[:asset_id])
      else
        asset_histories = AssetHistory.where(asset_id: params[:asset_id])
      end
      dates = asset_histories.pluck(:from_date, :to_date)
      today_date = Date.today.in_time_zone
      dates1 = dates.map do |a , b|
        unless b.present?
          [a, today_date]
        else
          [a, b]
        end
      end
      range = []
      dates1.each do |d|
        range.push (d[0].to_date..d[1].to_date).to_a
      end
      uniq_range = range.flatten().uniq
      date_range = uniq_range.map{|e| e.strftime("%Y-%m-%d")}

      render json: date_range
    else
      render json: "something went wrong"
    end
  end

  private

  def resource_params
    params.require(:asset_history).permit(:user_id ,:asset_id ,:from_date, :to_date,:active, :till_today)
  end

  def find_asset_history
    @resource = AssetHistory.find_by(id: params[:id])
  end
end
