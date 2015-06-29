require 'spec_helper'

register_star "getStarList"

describe Redtube::Star do
  describe ".all"  do
    it "should return a list of stars" do
      expect(Redtube::Star.all == 1580)
    end

    it "should return tha name" do
      expect(Redtube::Star.all.first.name).to eql("Nina Hartley")
    end
  end
end
