FactoryGirl.define do
  factory :user do
    first_name "Bob"
    last_name "Saget"
    sequence(:email) { |n| "BSaget#{n}@gmail.com" }
    password "Iambobsaget"
  end
  factory :station do
    sequence(:name) { |n| "Chinatown#{n}" }
    address "33 Harrison Ave"
    city "Boston"
    state "MA"
    zip "01234"
    user
  end
  factory :user do
    first_name "Bob"
    last_name "Saget"
    sequence(:email) { |n| "BSaget#{n}@gmail.com" }
    password "Iambobsaget"
    role "member"
  end
  factory :review do
    sequence(:body) { |n| "This station is awesome#{n}" }
    rating 5
    user
    station
  end
  factory :vote do
    review
    user
  end
end
