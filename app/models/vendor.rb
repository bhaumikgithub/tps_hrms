class Vendor < ApplicationRecord
  enum status: {
    Active: 0,
    Inactive: 1
  }

  validates_presence_of :name, :services, :contact_person, :mobile, :state, :city 
end
