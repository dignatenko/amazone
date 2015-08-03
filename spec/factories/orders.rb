FactoryGirl.define do
  factory :order do
    total_price { Faker::Number.between(0.0, 100.0).round(2) }
    completed_date Date.tomorrow
    aasm_state "in_progress"
    user { FactoryGirl.create(:user) }
    credit_card { FactoryGirl.create(:credit_card) }
  end

end
