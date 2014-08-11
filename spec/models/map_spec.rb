require 'spec_helper'

describe Map do
  describe 'associations' do
    it { should have_many(:map_routes).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
  end
end
