class AddColumnLeaves < ActiveRecord::Migration[5.2]
  def change
    add_column :leaves, :status, :string
  end
end
