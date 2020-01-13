class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.string :degree
      t.string :college
      t.string :university
      t.datetime :from
      t.datetime :to
      t.boolean :is_current, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
