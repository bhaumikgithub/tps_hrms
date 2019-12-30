class CreateFreeLeaves < ActiveRecord::Migration[5.2]
  def change
    create_table :free_leaves do |t|
      t.references :user, foreign_key: true
      t.float :extra_leave
      t.text :reason
      t.date :leave_month

      t.timestamps
    end
  end
end
