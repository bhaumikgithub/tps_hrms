class AssetType < ApplicationRecord
  # has_many :assets

  validates_presence_of :name
  validates :name, uniqueness: true
end
