class CreateLeaves < ActiveRecord::Migration[5.2]
  def change
    create_table :leaves do |t|
      t.string :leave_type
      t.references :user, foreign_key: true
      t.datetime :date
      t.string :approved_by

      t.timestamps
    end
  end
end
