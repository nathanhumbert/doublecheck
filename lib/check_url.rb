class DoubleCheck::CheckUrl
  require 'uri'

  def self.get_response(url)
    uri = URI.parse(url)
    response = Net::HTTP.start(uri.host, uri.port) do |http|
      if uri.path.empty?
        path = '/'
      else
        path = uri.path
      end
      http.get(path)
    end
  end
end
