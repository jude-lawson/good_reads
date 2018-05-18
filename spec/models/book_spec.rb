require 'rails_helper'

RSpec.describe Book do
  describe 'Validations' do
    it { should validate_presence_of(:title) }
  end

  describe 'Relationships' do
    it { should have_many(:reviews) }
  end

  describe 'Instance Methods' do
    describe '.average_rating' do
      it 'should return the average of the ratings for a book' do
        expect(@book1.average_rating).to eq(3.5)
      end
    end

    describe '.highest_rating' do
      it 'should return the highest rating' do
        expect(@book1.highest_review.rating).to eq(@book1.reviews.last.rating)
      end
    end
    
    describe '.lowest_rating' do
      it 'should return the lowest rating' do
        expect(@book1.lowest_review.rating).to eq(@book1.reviews.first.rating)
      end
    end
  end
end
