class AddDefaultValueToStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :reminders, :status, :integer, :default => 0
  end
end
