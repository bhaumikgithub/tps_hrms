class ArrangeSession < ApplicationRecord
  belongs_to :user
  validates_presence_of :topic, :description, :date, :timing, :speaker, :place, :applicants
end
