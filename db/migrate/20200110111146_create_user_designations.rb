class CreateUserDesignations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_designations do |t|
      t.references :designation, foreign_key: true
      t.references :department, foreign_key: true
      t.string :mentor
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, foreign_key: true
      t.boolean :is_current, default: false

      t.timestamps
    end
  end
end
