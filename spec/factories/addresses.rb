FactoryGirl.define do
  factory :address do
    street { Faker::Lorem.sentence(words_count=2) }
    zipcode { Faker::Number.number(6) }
    city { Faker::Lorem.sentence(words_count=2) }
    phone { Faker::Number.number(12) }
    order { FactoryGirl.create(:order) }
    country { FactoryGirl.create(:country) }
  end

end
