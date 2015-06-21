require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) { FactoryGirl.create(:customer) }
  it { expect(customer).to validate_presence_of(:email) }
  it { expect(customer).to validate_presence_of(:password) }
  it { expect(customer).to validate_presence_of(:first_name) }
  it { expect(customer).to validate_presence_of(:last_name) }
  it { expect(customer).to validate_uniqueness_of(:email) }
  it { expect(customer).to have_many(:orders)}
  it { expect(customer).to have_many(:ratings)}

  it "should return current order in progress" do
    order = FactoryGirl.create(:order)
    customer.orders << order
    expect(customer.current_order).to eq order
  end
end
