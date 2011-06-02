module Redtube
  class Video
    attr_reader :duration, :views, :id, :rating, :ratings, :title, :url, :thumb

    def self.find(id)
      video = Nokogiri::XML(Typhoeus::Request.get("http://api.redtube.com/?data=redtube.Videos.getVideoById&video_id=#{id}&output=xml").body).css("video").first
      new.tap do |object|
        object.instance_variable_set "@id", video["video_id"]
        %w(duration views rating ratings title url thumb).each do |name|
          object.instance_variable_set "@#{name}", video[name]
        end
      end
    end
  end
end
