class EventLink < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :link
  CATEGORY =  ["Festivals", "Wednesday Wonder", "Birthday"].freeze
end
