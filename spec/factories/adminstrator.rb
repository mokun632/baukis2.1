FactoryBot.define do
  factory :adminstrator do
    sequence(:email) { |n| "member#{n}@example.com" }
    password { "pw" }
    suspended { false }
  end
end
