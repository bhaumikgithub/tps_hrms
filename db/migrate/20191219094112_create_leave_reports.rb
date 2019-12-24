class CreateLeaveReports < ActiveRecord::Migration[5.2]
  def change
    create_table :leave_reports do |t|
      t.references :user, foreign_key: true
      t.date :start_month
      t.date :end_month
      t.float :prev_month_leave_bal
      t.float :free_leave
      t.float :taken_leave
      t.float :current_leave_bal

      t.timestamps
    end
  end
end
