class RenameSubjectToDescription < ActiveRecord::Migration[5.2]
  def change
  	rename_column :arrange_sessions, :subject, :description
  	rename_column :arrange_sessions, :username, :speaker
  	rename_column :arrange_sessions, :title, :topic
  end
end
