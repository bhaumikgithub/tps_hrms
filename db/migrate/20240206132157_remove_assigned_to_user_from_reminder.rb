class RemoveAssignedToUserFromReminder < ActiveRecord::Migration[5.2]
  def change
    remove_column :reminders, :assigned_to_user_id
  end
end
