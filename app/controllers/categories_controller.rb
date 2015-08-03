class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!
  
  def books
    @category = Category.find(params[:id])
    @categories = Category.all
    @books = Book.where(category_id: @category).page(params[:page]).per(9)
  end

end