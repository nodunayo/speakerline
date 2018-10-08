FactoryBot.define do
  factory :submission do
    result { :accepted }
    event_instance
    proposal
  end
end
