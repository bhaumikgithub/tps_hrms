class AddPlaceToArrangeSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :arrange_sessions, :place, :string
    add_column :arrange_sessions, :applicants, :string
  end
end
