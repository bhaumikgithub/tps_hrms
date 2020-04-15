class CreateUserReports < ActiveRecord::Migration[5.2]
  def change
    create_table :user_reports do |t|
      t.time :start_time
      t.time :end_time
      t.date :date
      t.text :detail
      t.string :total_hours
      t.references :project_member, foreign_key: true

      t.timestamps
    end
  end
end
