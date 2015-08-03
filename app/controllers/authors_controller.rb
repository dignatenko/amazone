class AuthorsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  private
    def author_params
      params.require(:author).permit(:first_name, :last_name, :biography, :count_in_stock, :author_id, :category_id)
    end
end
