class AddFieldsToCredential < ActiveRecord::Migration[5.2]
  def change
    add_column :credentials, :email, :string
    add_column :credentials, :password, :string
    add_column :credentials, :username, :string
  end
end
