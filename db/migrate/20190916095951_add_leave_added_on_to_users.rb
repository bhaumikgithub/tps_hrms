class AddLeaveAddedOnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :leave_added_on, :datetime
  end
end
