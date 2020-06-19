class ChangeCategoryToEventCategory < ActiveRecord::Migration[5.2]
  def change
  	remove_column :event_links, :category, :string
    add_reference :event_links, :event_category, foreign_key: true
  end
end
