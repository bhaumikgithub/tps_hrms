class CreateAssetHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :asset_histories do |t|
      t.references :user, foreign_key: true
      t.references :asset, foreign_key: true
      t.datetime :from_date
      t.datetime :to_date
      t.boolean :active

      t.timestamps
    end
  end
end
