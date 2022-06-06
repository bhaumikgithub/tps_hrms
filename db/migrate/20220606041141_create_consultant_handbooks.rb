class CreateConsultantHandbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :consultant_handbooks do |t|
      t.string :section
      t.text :content
      t.integer :position

      t.timestamps
    end
  end
end
