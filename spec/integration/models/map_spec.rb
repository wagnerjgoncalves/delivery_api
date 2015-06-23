require 'rails_helper'

describe Map do
  let!(:map) { create(:map) }

  describe 'validations' do
    it { should validate_uniqueness_of(:name) }
  end
end
