require 'spec_helper'

register_video "getVideoById&video_id=15485"
register_video "searchVideos&search=lesbian&page=1"

describe Redtube::Video do
  describe ".find" do
    let(:subject) { Redtube::Video.find(15485) }

    it "should return a video" do
      expect(subject).to be_a(Redtube::Video)
    end

    { 'duration' => '8:18', 'id' => '15485', 'title' => 'Sucking chocolate stick', 'url' => 'http://www.redtube.com/15485' }.each do |name, value|
      it "should return the #{name}" do
        expect(subject.send(name)).to eql(value)
      end
    end

    %w(rating ratings views thumb).each do |name|
      it "should return the #{name}" do
        expect(subject.send(name)).to_not be_nil
      end
    end
  end

  describe ".search" do
    let(:subject) { Redtube::Video.search("lesbian") }

    it "should return an array of videos" do
       expect(subject.size).to  eq(20)
    end
  end
end
