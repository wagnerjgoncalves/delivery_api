require 'rails_helper'

describe MapRoute do
  let!(:map_route) { create(:map_route) }

  describe 'validations' do
    subject do
      build(:map_route, map_id: map_route.map_id)
    end

    it "unquiness of from"  do
      subject.valid?

      expect(subject.errors[:from]).to include "has already been taken"
    end
  end
end
