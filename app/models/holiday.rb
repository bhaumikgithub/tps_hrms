class Holiday < ApplicationRecord
  HNAMES =  ["Uttarayan", "Vasi Uttarayan", "Republic day", "Dhuleti", 'Independence day', 'Rakshabandhan',  'Dusherra', 'Diwali', 'New Year', 'Bhai Duj', 'Extra'].freeze
  validates_presence_of :holiday_name, :holiday_date
  validates :holiday_name, uniqueness: true
end
