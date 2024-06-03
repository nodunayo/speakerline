FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    speaker
  end
end
