require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryGirl.create(:order) }
  it { expect(order).to validate_presence_of(:total_price) }
  it { expect(order).to validate_presence_of(:completed_date) }
  it { expect(order).to validate_presence_of(:aasm_state) }
  it { expect(order).to belong_to(:customer) }
  it { expect(order).to belong_to(:credit_card) }
  it { expect(order).to have_many(:order_items) }
  it { expect(order).to have_one(:billing_address).class_name('BillingAddress') }
  it { expect(order).to have_one(:shipping_address).class_name('ShippingAddress') }
end
