class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.references :department, foreign_key: true
      t.string :manager, references: :users, foreign_key: true
      t.string :client_name
      t.date :start_date
      t.date :end_date
      t.string :status

      t.timestamps
    end
  end
end
