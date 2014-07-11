require 'rails_helper'

describe Category do

  describe 'Associations' do

    it 'associates Category with Listing' do
      category = FactoryGirl.create(:category)
      listing = FactoryGirl.create(:listing, category_id: category.id)
      listing.category_id == category.id
    end
  end
end
