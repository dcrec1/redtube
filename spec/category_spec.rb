require "spec_helper"

register_category "getCategoriesList"

describe Redtube::Category do
  describe ".all" do
    it "should return a list of categories" do
      expect(Redtube::Category.all.size).to eq(32)
    end

    it "should return category names" do
      expect(Redtube::Category.all.first.name).to eql("amateur")
    end
  end
end
