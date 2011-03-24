class DoubleCheck::Sitemap
  require 'open-uri'
  require 'nokogiri'

  def initialize(url)
    @sitemap_url = url 
    @data = {}
  end

  def urls
    doc = Nokogiri::XML(open(@sitemap_url))
    urls = []
    doc.css('loc').each do |url|
      urls.push(url.content)
    end
    return urls
  end

  def process
    doc = Nokogiri::XML(open(@sitemap_url))
    doc.css('loc').each do |url|
      response = DoubleCheck::CheckUrl.get_response(url)
    end
  end

  def record_result(url, response)
    if @data[response.code].nil?
      @data[response.code] = [url]
    else
      @data[response.code].push(url)
    end 
  end
  
end
