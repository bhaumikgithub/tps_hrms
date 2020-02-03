class AddCancelledDateToLeaves < ActiveRecord::Migration[5.2]
  def change
    add_column :leaves, :cancelled_date, :datetime
  end
end
