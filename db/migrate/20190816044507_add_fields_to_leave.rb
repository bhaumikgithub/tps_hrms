class AddFieldsToLeave < ActiveRecord::Migration[5.2]
  def change
    add_column :leaves, :end_date, :date
    add_column :leaves, :color, :string
  end
end
