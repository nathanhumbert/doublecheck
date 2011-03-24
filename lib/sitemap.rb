class DoubleCheck::Sitemap
  require 'open-uri'
  require 'nokogiri'

  def initialize(url)
    @sitemap_url = url 
    @data = {}
  end

  def process
    doc = Nokogiri::XML(open(@sitemap_url))
    doc.css('loc').each do |url|
      response = DoubleCheck::CheckUrl.get_response(url.content)
      record_result(url.content, response)
    end
  end

  def record_result(url, response)
    if @data[response.code].nil?
      @data[response.code] = [url]
    else
      @data[response.code].push(url)
    end 
  end

  def data
    return @data
  end
  
end
