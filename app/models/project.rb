class Project < ApplicationRecord
  STATUS =  ["Active", "Completed", "Cancelled", "On Hold"].freeze
  belongs_to :department
  has_many :project_members
  has_many :users, through: :project_members
end
