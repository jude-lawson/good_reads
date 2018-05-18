require 'rails_helper'

RSpec.describe Review do
  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:rating) }
  end

  describe 'Relationships' do
    it { should belong_to(:book) }
    it { should belong_to(:user) }
  end
end
