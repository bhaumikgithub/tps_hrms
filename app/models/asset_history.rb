class AssetHistory < ApplicationRecord
  belongs_to :user
  belongs_to :asset

  # scope :activeDate, -> { where("? BETWEEN from_date AND to_date", Time.now.to_date)}
  scope :activeAtDate, lambda{ |date = Date.today| where("? BETWEEN from_date AND to_date", date) }

  scope :till_today_asset, -> {where(till_today: true, to_date: nil)}


end
