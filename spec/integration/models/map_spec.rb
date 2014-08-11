require 'spec_helper'

describe Map do
  let!(:map) { FactoryGirl.create(:map) }

  describe 'validations' do
    it { should validate_uniqueness_of(:name) }
  end
end
