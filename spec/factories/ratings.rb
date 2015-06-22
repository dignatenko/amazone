FactoryGirl.define do
  factory :rating do
    note { Faker::Lorem.sentence }
    value { Faker::Number.between(1, 10).to_i }
    book { FactoryGirl.create(:book) }
    customer { FactoryGirl.create(:customer) }
  end

end
