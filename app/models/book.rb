class Book < ActiveRecord::Base
  validates :title, :price, :count_in_stock, presence: true

  belongs_to :author
  belongs_to :category
  has_many :ratings
end
