class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :assets do |t|
      t.string :name
      t.string :bought_type
      t.string :code
      t.string :price
      t.text :specification
      t.string :current_status
      t.string :notes
      t.references :asset_type, foreign_key: true
      t.references :bill, foreign_key: true

      t.timestamps
    end
  end
end
