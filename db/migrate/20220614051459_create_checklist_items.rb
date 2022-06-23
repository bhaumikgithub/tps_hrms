class CreateChecklistItems < ActiveRecord::Migration[5.2]
  def change
    create_table :checklist_items do |t|
      t.string :name
      t.references :checklist, foreign_key: true

      t.timestamps
    end
  end
end
