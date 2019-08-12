class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :comp_name
      t.text :comp_address
      t.string :comp_contact
      t.string :comp_email
      t.string :website_link
      t.string :subdomain

      t.timestamps
    end
  end
end
