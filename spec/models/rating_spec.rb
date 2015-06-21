require 'rails_helper'

RSpec.describe Rating, type: :model do
  let(:rating) { FactoryGirl.create(:rating) }

  it { expect(rating).to belong_to(:book)}
  it { expect(rating).to belong_to(:customer)}
  it { expect(rating).to validate_numericality_of(:value).is_greater_than(0).is_less_than_or_equal_to(10)}

end
