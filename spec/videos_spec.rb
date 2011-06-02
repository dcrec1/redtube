require 'spec_helper'

describe Redtube::Video do
  describe "find" do
    before :all do
      @video = Redtube::Video.find(15485)
    end

    it "should return a video" do
      @video.should be_a(Redtube::Video)
    end

    { 'duration' => '8:18', 'id' => '15485', 'title' => 'Sucking chocolate stick', 'url' => 'http://www.redtube.com/15485' }.each do |name, value|
      it "should return the #{name}" do
        @video.send(name).should == value
      end
    end

    %w(rating ratings views thumb).each do |name|
      it "should return the #{name}" do
        @video.send(name).should_not be_nil
      end
    end
  end
end
