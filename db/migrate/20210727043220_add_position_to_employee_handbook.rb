class AddPositionToEmployeeHandbook < ActiveRecord::Migration[5.2]
  def change
    add_column :employee_handbooks, :position, :integer
  end
end
