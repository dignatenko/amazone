require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryGirl.create(:order) }
  it { expect(order).to validate_presence_of(:total_price) }
  it { expect(order).to validate_presence_of(:completed_date) }
  it { expect(order).to validate_presence_of(:aasm_state) }
  it { expect(order).to belong_to(:user) }
  it { expect(order).to belong_to(:credit_card) }
  it { expect(order).to have_many(:order_items) }
  it { expect(order).to have_one(:billing_address).class_name('BillingAddress') }
  it { expect(order).to have_one(:shipping_address).class_name('ShippingAddress') }
  it "should return count_total_price correct" do
    book1 = FactoryGirl.create(:book)
    book2 = FactoryGirl.create(:book)
    order.add_order_item(book1, 2)
    expect(order.total_price).to eq (book1.price * 2).round(2)
    order.add_order_item(book2, 1)
    expect(order.total_price).to eq (book1.price * 2 + book2.price).round(2)
  end
  it "should return count_total_price correct" do
    book1 = FactoryGirl.create(:book)
    book2 = FactoryGirl.create(:book)
    order.add_order_item(book1, 4)
    expect(order.total_price).to eq (book1.price * 4).round(2)
    order.add_order_item(book2, 3)
    expect(order.total_price).to eq (book1.price * 4 + book2.price * 3).round(2)
  end
  it "should return count_total_price correct" do
    book1 = FactoryGirl.create(:book)
    book2 = FactoryGirl.create(:book)
    book3 = FactoryGirl.create(:book)
    book4 = FactoryGirl.create(:book)
    order.add_order_item(book1, 2)
    expect(order.total_price).to eq (book1.price * 2).round(2)
    order.add_order_item(book2, 4)
    expect(order.total_price).to eq (book1.price * 2 + book2.price * 4).round(2)
    order.add_order_item(book3, 1)
    expect(order.total_price).to eq (book1.price * 2 + book2.price * 4 + book3.price).round(2)
    order.add_order_item(book4, 3)
    expect(order.total_price).to eq (book1.price * 2 + book2.price * 4 + book3.price + book4.price * 3).round(2)
  end
end