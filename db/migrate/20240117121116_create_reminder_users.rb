class CreateReminderUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :reminder_users do |t|
      t.references :reminder, foreign_key: true
      t.references :assigned_to_user, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
