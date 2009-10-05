require 'rubygems'

require File.join(File.dirname(__FILE__), *%w[.. lib litc])
require 'test/unit'
require 'shoulda'
require 'fakeweb'
require 'ruby-debug'

include Litc

class Test::Unit::TestCase

  def response_for(item)
    item = Litc.urlize(item)
    File.read(fixture_path_for(item)).gsub(/.*\n\n/m,'').strip
  end

  def fixture_path_for(item)
    File.dirname(__FILE__) + "/fixtures/#{item.gsub(/\/(.+)$/, '_\\1').gsub(/\/$/,'')}"
  end

  def setup
    Litc::ITEMS.each do |item|
      uri = "http://169.254.169.254/latest/"
      uri << "meta-data/" unless item == 'user-data'
      uri << item
      FakeWeb.register_uri(:get, uri, :response => File.read(fixture_path_for(item)))
    end
  end

end
