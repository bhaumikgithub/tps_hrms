class AddTillTodayToAssetHistory < ActiveRecord::Migration[5.2]
  def change
    add_column :asset_histories, :till_today, :boolean, default: false
  end
end
