require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  it { expect(user).to validate_presence_of(:email) }
  it { expect(user).to validate_presence_of(:first_name) }
  it { expect(user).to validate_presence_of(:last_name) }
  it { expect(user).to validate_uniqueness_of(:email) }
  it { expect(user).to have_many(:orders)}
  it { expect(user).to have_many(:ratings)}

  it "should return current order in progress" do
    order = FactoryGirl.create(:order)
    user.orders << order
    expect(user.current_order).to eq order
  end
end
