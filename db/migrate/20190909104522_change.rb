class Change < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :birthday, :datetime
    change_column :users, :anniversary_date, :datetime
    change_column :users, :join_date, :datetime

  end
end
