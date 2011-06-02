require 'spec_helper'

register_tag "getTagList"

describe Redtube::Tag do
  describe ".all" do
    it "should return an array of tags" do
      Redtube::Tag.all.size.should == 124 
    end

    it "should return the name of the tag" do
      Redtube::Tag.all.first.name.should eql("Amateur")
    end
  end
end
