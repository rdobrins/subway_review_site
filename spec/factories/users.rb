FactoryGirl.define do
  factory :user do
    first_name "Bob"
    last_name "Saget"
    sequence(:email) { |n| "BSaget#{n}@gmail.com" }
    password "Iambobsaget"
    role "member"
  end
end
