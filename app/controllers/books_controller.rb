class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews
    @average_rating = @book.average_rating
    @highest_rating = @book.highest_rating
    @lowest_rating = @book.lowest_rating
  end
end
