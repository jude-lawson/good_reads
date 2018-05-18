class Book < ApplicationRecord
  validates_presence_of :title
  
  has_many :reviews

  def average_rating
    self.reviews.average(:rating)
  end

  def highest_rating
    self.reviews.order('rating DESC').first.rating
  end
  
  def lowest_rating
    self.reviews.order(:rating).first.rating
  end
end
