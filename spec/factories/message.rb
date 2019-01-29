FactoryBot.define do
  factory :message do
    description { FFaker::Lorem.sentence }
    language { "en" }
  end
end