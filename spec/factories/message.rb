FactoryBot.define do
  factory :message do
    index = rand(0..1)
    lang = ["pt-br","eng"]
    description { FFaker::Lorem.phrase }
    language { lang[index] }
  end
end