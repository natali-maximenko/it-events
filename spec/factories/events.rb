FactoryGirl.define do
  factory :event do
    title 'testing'
    description 'description description description'
    started_at 2.days.ago
    address 'Ростов-на-Дону'
    organizer
  end
end
