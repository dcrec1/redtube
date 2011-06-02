module Redtube
  class Star < Base
    attr_reader :name

    def self.all
      find_by_query "getStarList"
    end

    def initialize(star)
      @name = star.content
    end
  end
end
