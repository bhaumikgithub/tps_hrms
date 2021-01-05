class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.string :subject_class
      t.string :action
      t.string :name

      t.timestamps
    end
  end
end
