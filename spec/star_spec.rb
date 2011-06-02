require 'spec_helper'

register_star "getStarList"

describe Redtube::Star do
  describe ".all"  do
    it "should return a list of stars" do
      Redtube::Star.all.size.should == 1580
    end

    it "should return tha name" do
      Redtube::Star.all.first.name.should eql("Nina Hartley") 
    end
  end
end
