module Redtube
  class Tag < Base
    attr_reader :name

    def self.all
      find_by_query "getTagList"
    end

    def initialize(name)
      @name = name.content
    end
  end
end
