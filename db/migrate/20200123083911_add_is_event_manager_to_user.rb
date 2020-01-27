class AddIsEventManagerToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_event_manager, :boolean, default: false
  end
end
