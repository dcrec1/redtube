require 'spec_helper'

register_tag "getTagList"

describe Redtube::Tag do
  describe ".all" do
    it "should return an array of tags" do
      expect(Redtube::Tag.all.size).to eq(124)
    end

    it "should return the name of the tag" do
      expect(Redtube::Tag.all.first.name).to eql("Amateur")
    end
  end
end
