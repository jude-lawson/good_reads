require 'rails_helper'

RSpec.describe 'Book Pages' do
  before :each do
    @book1 = Book.create!(title: 'The Hobbit')
    @book2 = Book.create!(title: 'Cosmos')

    @user1 = User.create!(name: 'User 1')
    @user2 = User.create!(name: 'User 2')

    @book1.reviews.create!(title: 'Great Book', body:'Seriously, what a great book.', rating: '3', user_id: @user1.id)
    @book1.reviews.create!(title: 'Superb Book', body:'Seriously, what a superb book.', rating: '4', user_id: @user2.id)

    @book2.reviews.create!(title: 'Fantastic Book', body:'Seriously, what a fantastic book.', rating: '4', user_id: @user1.id)
    @book2.reviews.create!(title: 'Wonderful Book', body:'Seriously, what a wonderful book.', rating: '5', user_id: @user2.id)
  end

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
      end
    end
  end
end
