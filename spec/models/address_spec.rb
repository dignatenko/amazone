require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:address) { FactoryGirl.create(:address) }
  it { expect(address).to validate_presence_of(:street) }
  it { expect(address).to validate_presence_of(:zipcode) }
  it { expect(address).to validate_presence_of(:city) }
  it { expect(address).to validate_presence_of(:phone) }
  it { expect(address).to validate_presence_of(:country_id) }
  it { expect(address).to belong_to(:order) }
  it { expect(address).to belong_to(:country) }
end
