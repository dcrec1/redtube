require 'rubygems'
require 'bundler/setup'

require 'redtube' # and any other gems you need
require 'fakeweb'

RSpec.configure do |config|
  # some (optional) config here
end

def response(name)
  File.open("#{File.dirname(__FILE__)}/responses/#{name}.xml").read
end

def register_video(path)
  register "Videos.#{path}"
end

def register_tag(path)
  register "Tags.#{path}"
end

def register_star(path)
  register "Stars.#{path}"
end

def register_category(path)
  register "Categories.#{path}"
end

def register(path)
  FakeWeb.register_uri(:get, "http://api.redtube.com/?output=xml&data=redtube.#{path}", :body => response(path.split("&").first.split(".").last))
end

FakeWeb.allow_net_connect = false
