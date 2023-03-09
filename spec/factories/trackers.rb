FactoryBot.define do
  factory :tracker do
    user nil
    project_name nil
    tracker_name "MyString"
    start_date ""
    end_date ""
    current ""
    no_tracker false
  end
end
