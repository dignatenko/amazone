class Book < ActiveRecord::Base
  validates :title, :price, :count_in_stock, presence: true

  belongs_to :author
  belongs_to :category
  has_many :ratings
  has_many :order_items, dependent: :destroy

  QUANTITY = 5
  DECIMAL_PLACES = 2
  #QUANTITY_BOOKS_IN_ROW = 3
  
  def set_middle_rating
    rating = (ratings.map{ |rating| rating.value}.sum.to_f / ratings.size).round(DECIMAL_PLACES)
    self.update(middle_rating: rating) unless middle_rating == rating
  end

  def self.most_popular
    ratings = Book.all.map{ |book| book.middle_rating }.sort.reverse.first(QUANTITY)
    ratings.map{ |rating| Book.find_by(middle_rating: rating) }
  end

end
