class AddDefaultValueInTracker < ActiveRecord::Migration[5.2]
  def change
    change_column :trackers, :no_tracker, :boolean, :default => false
  end
end
