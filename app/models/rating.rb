class Rating < ActiveRecord::Base
  validates :value, :numericality => { :greater_than => 0, :less_than_or_equal_to => 10 }

  belongs_to :book
  belongs_to :customer
end
