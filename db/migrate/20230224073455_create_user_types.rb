class CreateUserTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_types do |t|
      t.string :employee_type
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, foreign_key: true
      t.boolean :is_current, default: false
      t.timestamps
    end
  end
end
