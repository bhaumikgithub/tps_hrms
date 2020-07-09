class AssetHistory < ApplicationRecord
  belongs_to :user
  belongs_to :asset

  # scope :activeDate, -> { where("? BETWEEN from_date AND to_date", Time.now.to_date)}
  scope :activeAtDate, lambda{ |date = Date.today| where("? BETWEEN from_date AND to_date", date) }

end
