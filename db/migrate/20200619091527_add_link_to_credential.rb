class AddLinkToCredential < ActiveRecord::Migration[5.2]
  def change
    add_column :credentials, :link, :string
  end
end
