module Redtube
  class Category < Base
    attr_reader :name

    def self.all
      find_by_query "getCategoriesList"
    end

    def initialize(name)
      @name = name.content
    end

    def self.plural_name
      "Categories"
    end
  end
end
