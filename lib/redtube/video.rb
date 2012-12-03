module Redtube
  class Video < Base
    attr_accessor :id, :duration, :views, :rating, :ratings, :title, :url, :thumb

    def self.find(id)
      find_by_query("getVideoById&video_id=#{id}").first
    end

    def self.search(term, page = 1)
      find_by_query "searchVideos&search=#{term}&page=#{page}"
    end

    def initialize(video)
      @id = video["video_id"]
      %w(duration views rating ratings title url thumb).each { |name| send "#{name}=", video[name] }
    end
  end
end
