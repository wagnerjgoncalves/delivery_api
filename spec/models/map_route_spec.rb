require 'spec_helper'

describe MapRoute do
  describe 'associations' do
    it { should belong_to :map }
  end

  describe 'validations' do
    it { should validate_presence_of :from }
    it { should validate_presence_of :to }
    it { should validate_presence_of :distance }
    it { should validate_presence_of :map_id }
  end
end
