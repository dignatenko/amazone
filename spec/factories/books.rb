FactoryGirl.define do
  factory :book do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    price { Faker::Number.between(0.0, 100.0).round(2) }
    count_in_stock { Faker::Number.number(2).to_i }
    author { FactoryGirl.create(:author) }
    category { FactoryGirl.create(:category) }
  end
end
