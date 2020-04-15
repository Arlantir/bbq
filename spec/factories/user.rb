FactoryBot.define do
  factory :user do
    name { "Товарисч_#{rand(999)}" }
    sequence(:email) { |n| "example_#{n}@example.com" }
    password { "foobar" }
    password_confirmation { "foobar" }
  end
end