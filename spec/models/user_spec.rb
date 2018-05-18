require 'rails_helper'

RSpec.describe User do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'Reltionships' do
    it { should have_many(:reviews) }
  end
end
