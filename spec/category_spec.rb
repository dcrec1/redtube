require "spec_helper"

register_category "getCategoriesList"

describe Redtube::Category do
  describe ".all" do
    it "should return a list of categories" do
      Redtube::Category.all.size.should == 32
    end

    it "should return category names" do
      Redtube::Category.all.first.name.should == "amateur"
    end
  end
end
