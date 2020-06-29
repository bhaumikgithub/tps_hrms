class Asset < ApplicationRecord
  belongs_to :asset_type
  belongs_to :bill, optional: true

  enum bought_types: [:brand_new, :old, :refurbish]
  enum status: [:latest, :idle, :assigned, :damaged, :sold, :ewaste, :scrapped]
end
