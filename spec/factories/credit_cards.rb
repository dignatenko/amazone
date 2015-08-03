FactoryGirl.define do
  factory :credit_card do
    number { Faker::Number.number(16) }
    cvv { Faker::Number.number(4) }
    expiration_month { Faker::Number.number(2).to_i }
    expiration_year { Faker::Number.number(4).to_i }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    user { FactoryGirl.create(:user) }
  end

end
