FactoryGirl.define do
  factory :order_item do
    price { Faker::Number.between(0.0, 100.0).round(2).to_f }
    quantity { Faker::Number.number(2).to_i }
    book { FactoryGirl.create(:book) }
    order { FactoryGirl.create(:order) }
  end

end
