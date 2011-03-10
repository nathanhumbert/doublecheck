class DoubleCheck::Sitemap
  require 'rubygems'
  require 'net/http'
  require 'uri'
  require 'nokogiri'

  def initialize(url)
    uri = URI.parse(url)   
    @response = Net::HTTP.start(uri.host, uri.port) do |http|
      http.get(uri.path)
    end
  end

  def urls
    doc = Nokogiri::XML.parse(@response.body)
    doc.xpath('//url').each do |url|
      puts url.xpath('loc') 
    end
  end
  
end
