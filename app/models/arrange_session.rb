class ArrangeSession < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :subject, :date, :timing, :username
end
