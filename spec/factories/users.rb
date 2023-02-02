require 'faker'
FactoryBot.define do
  factory :user do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    contact {Faker::PhoneNumber.cell_phone}
    email {Faker::Internet.email}
    password {Faker::Internet.password}
    comp_email {Faker::Internet.email}
    role_id {Faker::Number.between(from = 1 ,to = 3 )}
    user_type {['Employee','Consultant','Admin'].sample}
    
    birthday {Faker::Date.birthday}
    leave_bal {Faker::Number.between(from = 1 ,to = 5 )}
    emp_code {Faker::Number.between(from=1, to = 500)}
    gender {['Male','Female'].sample}
  end
end
