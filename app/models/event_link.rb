class EventLink < ApplicationRecord
  belongs_to :user
  belongs_to :event_category
  validates_presence_of :title, :link
end
