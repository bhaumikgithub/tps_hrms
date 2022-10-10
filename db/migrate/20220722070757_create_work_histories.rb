class CreateWorkHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :work_histories do |t|
      t.text :year
      t.text :mentor
      t.text :peer
      t.text :team_member
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
