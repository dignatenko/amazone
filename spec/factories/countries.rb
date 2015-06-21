FactoryGirl.define do
  factory :country do
    name { Faker::Lorem.sentence(words_count=2) }
  end

end
