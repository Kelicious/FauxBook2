FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "password"
    password_confirmation "password"
    sequence(:first_name) { |n| "First#{n}"}
    sequence(:last_name) { |n| "Last#{n}"}
    gender "male"
    birth_date Date.parse("1999-12-31")
  end
end
