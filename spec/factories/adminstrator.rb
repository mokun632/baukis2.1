FactoryBot.define do
  factory :adminstrator do
    sequence(:email){ |n| "member#{n}@examole.com" }
    password { "pw" }
    suspended { false }
  end
end
