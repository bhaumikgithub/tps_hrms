class AddReasonToLeaves < ActiveRecord::Migration[5.2]
  def change
    add_column :leaves, :leave_reason, :text
    add_column :leaves, :cancelled_reason, :text
    add_column :leaves, :duration_of_leave, :integer
    add_column :leaves, :request_date, :datetime
    add_column :leaves, :approved_date, :datetime
    add_column :leaves, :phone_availability, :boolean, default: false
    add_column :leaves, :emergency_contact, :string
    add_column :leaves, :availability_in_ahmd, :boolean, default: false
  end
end
