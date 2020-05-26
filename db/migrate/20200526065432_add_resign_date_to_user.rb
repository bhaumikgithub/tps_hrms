class AddResignDateToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :resign_date, :datetime
    add_column :users, :resign_reason, :text
  end
end
