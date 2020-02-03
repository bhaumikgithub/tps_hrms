class AddCategoryToEventLink < ActiveRecord::Migration[5.2]
  def change
    add_column :event_links, :category, :string
    add_column :event_links, :event_date, :date
  end
end
