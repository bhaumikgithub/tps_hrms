class CreateChecklists < ActiveRecord::Migration[5.2]
  def change
    create_table :checklists do |t|
      t.string :category
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
