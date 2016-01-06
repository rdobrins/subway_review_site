FactoryGirl.define do
  factory :review do
    sequence(:body) { |n| "This station is awesome#{n}" }
    rating "33 Harrison Ave"
    user_id "1"
    station_id "1"
  end
end
