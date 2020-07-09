class AddWarrantyToAsset < ActiveRecord::Migration[5.2]
  def change
    add_column :assets, :warranty, :string
  end
end
