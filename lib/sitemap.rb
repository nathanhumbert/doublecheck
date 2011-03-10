class DoubleCheck::Sitemap
  require 'open-uri'
  require 'nokogiri'

  def initialize(url)
    @url = url 
  end

  def urls
    doc = Nokogiri::XML(open(@url))
    urls = []
    doc.css('loc').each do |url|
      urls.push(url.content)
    end
    return urls
  end
  
end
