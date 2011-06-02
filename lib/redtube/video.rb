module Redtube
  class Video
    attr_accessor :id, :duration, :views, :rating, :ratings, :title, :url, :thumb

    def self.find(id)
      find_by_query("getVideoById&video_id=#{id}").first
    end

    def self.search(term)
      find_by_query "searchVideos&search=#{term}"
    end

    def initialize(video)
      @id = video["video_id"]
      %w(duration views rating ratings title url thumb).each { |name| send "#{name}=", video[name] }
    end

    private

    def self.find_by_query(query)
      videos_by_query(query).map { |video| new video }
    end

    def self.videos_by_query(query)
      Nokogiri::XML(get(query)).css "video"
    end

    def self.get(query)
      open("http://api.redtube.com/?output=xml&data=redtube.Videos.#{query}").read
    end
  end
end
