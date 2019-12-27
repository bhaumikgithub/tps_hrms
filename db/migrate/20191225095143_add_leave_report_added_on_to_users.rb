class AddLeaveReportAddedOnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :leave_report_added_on, :datetime
  end
end
