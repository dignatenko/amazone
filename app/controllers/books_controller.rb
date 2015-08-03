class BooksController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @books = Book.all.page(params[:page]).per(9)
    @categories = Category.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def home
    books = Book.most_popular
    @book = books.sample
  end

  def other
    books = Book.most_popular.reject{ |book|book.id == params[:id].to_i }
    @book = books.sample
    render 'home'
  end

end
