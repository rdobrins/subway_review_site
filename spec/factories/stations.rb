FactoryGirl.define do
  factory :station do
    sequence(:name) { |n| "Chinatown#{n}" }
    address "33 Harrison Ave"
    city "Boston"
    state "MA"
    zip "01234"
  end
end
