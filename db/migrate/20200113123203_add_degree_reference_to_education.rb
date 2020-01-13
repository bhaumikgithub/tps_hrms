class AddDegreeReferenceToEducation < ActiveRecord::Migration[5.2]
  def change
  	remove_column :educations, :degree, :string
    add_reference :educations, :degree, foreign_key: true
  end
end
