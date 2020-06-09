class CreateCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :credentials do |t|
      t.string :project_name
      t.text :notes
      t.string :last_updated_by
      t.references :credential_type, foreign_key: true

      t.timestamps
    end
  end
end
