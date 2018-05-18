class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews
    @average_rating = @book.average_rating
    @highest = @book.highest_review
    @lowest = @book.lowest_review
    @highest_review = @highest.rating
    @lowest_review = @lowest.rating
  end
end
