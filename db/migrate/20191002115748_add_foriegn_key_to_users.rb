class AddForiegnKeyToUsers < ActiveRecord::Migration[5.2]
  def change

    remove_column :users, :degree
    remove_column :users, :dept
    remove_column :users, :designation
    add_column :users, :degree_id, :integer
    add_column :users, :department_id, :integer
    add_column :users, :designation_id, :integer
    add_reference :degrees, :user, foreign_key: true
    add_reference :departments, :user, foreign_key: true
    add_reference :designations, :user, foreign_key: true

  end
end
