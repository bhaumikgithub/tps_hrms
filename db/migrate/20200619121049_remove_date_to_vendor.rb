class RemoveDateToVendor < ActiveRecord::Migration[5.2]
  def change
  	remove_column :vendors, :date, :string
  	remove_column :vendors, :register_date, :string
  	remove_column :vendors, :status, :string

  	add_column :vendors, :register_date, :datetime
  	add_column :vendors, :status, :integer, default: 0
  end
end
