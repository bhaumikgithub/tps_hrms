class CreateEmployeeHandbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_handbooks do |t|
      t.string :section
      t.text :content

      t.timestamps
    end
  end
end
