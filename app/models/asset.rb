class Asset < ApplicationRecord
  belongs_to :asset_type
  belongs_to :bill, optional: true
  has_many :asset_histories

  enum bought_types: [:brand_new, :old, :refurbish]
  enum status: [:active, :idle, :assigned, :damaged, :sold, :ewaste, :scrapped]



  def current_assigned_device
  	till_today_asset = self.asset_histories.till_today_asset
  	active_asset = self.asset_histories.activeAtDate(Date.today)
  	if till_today_asset.present?
  		till_today_asset&.last&.user&.full_name
  	elsif active_asset.present?
  		active_asset&.last&.user&.full_name
  	else
  		'Not assigned'
  	end
  end
end
