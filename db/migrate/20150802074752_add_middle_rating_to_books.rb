class AddMiddleRatingToBooks < ActiveRecord::Migration
  def change
    add_column :books, :middle_rating, :float, default: 0
  end
end
