class Book < ApplicationRecord
  validates_presence_of :title
  
  has_many :reviews

  def average_rating
    self.reviews.average(:rating)
  end

  def highest_review
    self.reviews.order('rating DESC').first
  end
  
  def lowest_review
    self.reviews.order(:rating).first
  end
end
