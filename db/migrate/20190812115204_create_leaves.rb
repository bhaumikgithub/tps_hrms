class CreateLeaves < ActiveRecord::Migration[5.2]
  def change
    create_table :leaves do |t|
      t.string :leave_type
      t.references :user, foreign_key: true
      t.datetime :leave_date
      t.references :approved_by, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
