require 'spec_helper'

def response(name)
  File.open("#{File.dirname(__FILE__)}/responses/#{name}.xml").read
end

def register(path)
  FakeWeb.register_uri(:get, "http://api.redtube.com/?output=xml&data=redtube.Videos.#{path}", :body => response(path.split("&").first))
end

FakeWeb.allow_net_connect = false
register "getVideoById&video_id=15485"
register "searchVideos&search=lesbian"

describe Redtube::Video do
  describe ".find" do
    let(:subject) { Redtube::Video.find(15485) }

    it "should return a video" do
      subject.should be_a(Redtube::Video)
    end

    { 'duration' => '8:18', 'id' => '15485', 'title' => 'Sucking chocolate stick', 'url' => 'http://www.redtube.com/15485' }.each do |name, value|
      it "should return the #{name}" do
        subject.send(name).should == value
      end
    end

    %w(rating ratings views thumb).each do |name|
      it "should return the #{name}" do
        subject.send(name).should_not be_nil
      end
    end
  end

  describe ".search" do
    let(:subject) { Redtube::Video.search("lesbian") }

    it "should return an array of videos" do
      subject.size.should == 20 
    end
  end
end
