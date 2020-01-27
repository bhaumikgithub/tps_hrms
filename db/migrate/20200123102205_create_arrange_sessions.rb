class CreateArrangeSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :arrange_sessions do |t|
      t.string :title
      t.string :subject
      t.datetime :date
      t.time :timing
      t.string :username
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
