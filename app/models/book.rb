class Book < ApplicationRecord
  validates_presence_of :title
  
  has_many :reviews

  def average_rating
    self.reviews.average(:rating)
  end
end
