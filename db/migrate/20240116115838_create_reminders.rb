class CreateReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :reminders do |t|
      t.datetime :reminder_date_time
      t.text :content
      t.integer :status
      t.references :user
      t.references :assigned_to_user

      t.timestamps
    end
  end
end
