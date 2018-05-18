require 'rails_helper'

RSpec.describe 'Book Pages' do
  context '/books/:id' do
    describe 'A user visits the page for a specific book' do
      it 'they should see the information and reviews for that specific book' do
        visit book_path(@book1)

        expect(page).to have_content(@book1.title)
        expect(page).to_not have_content(@book2.title)

        @book1.reviews.each do |review|
          expect(page).to have_content(review.title)
          expect(page).to have_content(review.body)
          expect(page).to have_content(review.rating)
          expect(page).to have_content(User.find(review.user_id).name)
        end

        expect(page).to have_content(@book1.reviews.average(:rating))
      end
    end
  end
end
