FactoryBot.define do
  factory :tag, class: ActsAsTaggableOn::Tag do
    name { Faker::Name.name }
  end
end
