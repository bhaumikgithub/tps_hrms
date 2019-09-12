class AddLeaveBalanceToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :leave_bal, :float
  end
end
