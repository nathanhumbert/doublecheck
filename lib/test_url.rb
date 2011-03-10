class DoubleCheck::TestUrl
  require 'uri'
  def initialize(url)
    @url = URI.parse(url)
  end

  def test
    response = make_request 
    puts 'HTTP code: ' + response.code + ' for ' + @url.host + @url.path
  end

  def make_request
    response = Net::HTTP.start(@url.host, @url.port) do |http|
      http.get(@url.path)
    end
  end
end
