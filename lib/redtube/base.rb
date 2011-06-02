module Redtube
  class Base
    def self.find_by_query(query)
      elements_by_query(query).map { |element| new element }
    end

    def self.elements_by_query(query)
      Nokogiri::XML(get(query)).css name.downcase
    end

    def self.get(query)
      open("http://api.redtube.com/?output=xml&data=redtube.#{name}s.#{query}").read
    end

    def self.name
      super.gsub("Redtube::", "")
    end
  end
end
