FactoryGirl.define do
  factory :review do
    sequence(:body) { |n| "This station is awesome#{n}" }
    rating 5
    sequence(:user_id) { |n| n + 5 }
    station_id "1"
  end
end
