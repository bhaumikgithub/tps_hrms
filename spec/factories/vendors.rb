require 'faker'
FactoryBot.define do
  factory :vendor do
    name {Faker::Name.first_name}
    services {Faker::Commerce.department}
    contact_person {Faker::PhoneNumber.cell_phone}
    mobile {Faker::PhoneNumber.cell_phone}
    state {Faker::Address.state}
    city {Faker::Address.city}
  end
end
