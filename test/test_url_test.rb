require 'test/unit'
require 'doublecheck'
require 'fakeweb'

class TestUrlTest < Test::Unit::TestCase
  def setup
    @body = 'This is a test'
    FakeWeb.register_uri(:get, 'http://www.example.com/', :body => @body, :status => ['200', 'OK'])
    FakeWeb.register_uri(:get, 'http://www.example.com/foo', :status => ['404', 'Not Found'])
  end

  def test_initialize
    test_url = DoubleCheck::TestUrl.new('http://www.example.com/')
    assert_equal URI.parse('http://www.example.com/'), test_url.instance_variable_get(:@url)
  end

  def test_make_request
    test_url = DoubleCheck::TestUrl.new('http://www.example.com/')
    assert_equal @body, test_url.make_request.body
  end

end
