require 'rails_helper'

RSpec.describe Book do
  describe 'Validations' do
    it { should validate_presence_of(:title) }
  end

  describe 'Relationships' do
    it { should have_many(:reviews) }
  end
end
