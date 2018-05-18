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
  end
end
