class CreateTrackers < ActiveRecord::Migration[5.2]
  def change
    create_table :trackers do |t|
      t.references :user, foreign_key: true
      t.string :project_name
      t.string :tracker_name
      t.date :start_date
      t.date :end_date
      t.boolean :is_current, default: false
      t.boolean :no_tracker

      t.timestamps
    end
  end
end
