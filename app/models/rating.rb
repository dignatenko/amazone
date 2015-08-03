class Rating < ActiveRecord::Base
  validates :value, :numericality => { :greater_than => 0, :less_than_or_equal_to => 10 }
  after_save :count_book_middle_rating
  after_destroy :count_book_middle_rating

  belongs_to :book
  belongs_to :user

  private
  
  def count_book_middle_rating
    book.set_middle_rating
  end
end
