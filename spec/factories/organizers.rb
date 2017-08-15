FactoryGirl.define do
  factory :organizer do
    name 'name'
    description 'description'
    email 'test@gmail.com'
    password 'paSsWodD'
    password_confirmation { password }

    factory :organizer_with_evens do
      transient do
        evnts_count 3
      end

      after(:create) do |organizer, evaluator|
        create_list(:event, evaluator.packs_count, organizer: organizer)
      end
    end
  end

  factory :empty_organizer, class: Organizer do
    email 'test'
    password '12'
    password_confirmation '21'
  end
end
