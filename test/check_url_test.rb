require 'test/unit'
require 'doublecheck'
require 'fakeweb'

class CheckUrlTest < Test::Unit::TestCase
  def setup
    @body = 'This is a test'
    FakeWeb.register_uri(:get, 'http://www.example.com/', :body => @body, :status => ['200', 'OK'])
    FakeWeb.register_uri(:get, 'http://www.example.com/foo', :status => ['404', 'Not Found'])
  end


  def test_get_response

    response = DoubleCheck::CheckUrl.get_response('http://www.example.com/')
    assert_equal '200', response.code
    assert_equal @body, response.body
  end

end
