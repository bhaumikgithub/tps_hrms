class WorkHistory < ApplicationRecord
  self.table_name = :work_histories
  belongs_to :user

  validates_presence_of :year
end
