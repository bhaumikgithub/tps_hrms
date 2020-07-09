class AssetHistoriesController < ApplicationController
  load_and_authorize_resource
  include InheritAction

  def filter_date
    if params[:asset_id].present?
      a = AssetHistory.where(asset_id: params[:asset_id]).where('from_date >= ? OR to_date >= ?', Date.today,  Date.today)
      dates = a.pluck(:from_date, :to_date)
      range = []
      dates.each do |d|
        range.push (d[0].to_date..d[1].to_date).to_a
      end
      uniq_range = range.flatten().uniq
      date_range = uniq_range.map{|e| e.strftime("%Y-%m-%d")}

      render json: date_range
    else
      render json: "something went wrong"
    end
  end
end
