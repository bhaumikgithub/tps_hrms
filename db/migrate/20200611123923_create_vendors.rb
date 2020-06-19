class CreateVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :services
      t.string :contact_person
      t.string :mobile
      t.string :email
      t.string :gst
      t.string :pan
      t.string :tan
      t.text :address
      t.string :city
      t.string :state
      t.string :register_date
      t.string :date
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
