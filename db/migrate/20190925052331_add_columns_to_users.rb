class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :experience
    add_column :users, :experience, :float
    add_column :users, :gender, :string
    add_column :users, :emp_code, :string
  end
end
