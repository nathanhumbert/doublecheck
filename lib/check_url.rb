class DoubleCheck::CheckUrl
  require 'uri'

  def self.get_response(url)
    uri = URI.parse(url)
    response = Net::HTTP.start(uri.host, uri.port) do |http|
      http.get(uri.path)
    end
  end
end
