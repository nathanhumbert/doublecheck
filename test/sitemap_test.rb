require 'test/unit'
require 'doublecheck'
require 'fakeweb'
require 'mocha'

class SitemapTest < Test::Unit::TestCase
  def setup
    @body = IO.read(File.join('test', 'fixtures', 'sitemap.xml'))
    @sitemap_url = 'http://www.example.com/sitemap.xml'
    FakeWeb.register_uri(:get, @sitemap_url, :body => @body)
    @sitemap = DoubleCheck::Sitemap.new(@sitemap_url)
  end

  def test_initialize_sets_url_instance_variable
    setup
    assert_equal @sitemap_url, @sitemap.instance_variable_get(:@sitemap_url)
  end

  def test_initialize_sets_data_instance_variable_to_empty_hash
    setup
    data = {}
    assert_equal data, @sitemap.instance_variable_get(:@data)
  end 

  def test_process_puts_correct_data_in_data_instance_variable
    setup
    @sitemap.process
    data = {'404' => ['http://www.example.com/foo'], '200' => ['http://www.example.com/']}
    assert_equal data, @sitemap.instance_variable_get(:@data)
  end

  def test_record_result
    setup
    response = mock()
    response.stubs(:code).returns('100')
    @sitemap.record_result('test', response)
    data = {'100' => ['test']} 
    assert_equal data, @sitemap.instance_variable_get(:@data)
  end

  def test_data_returns_data_instance_variable_contents
    setup
    @sitemap.instance_variable_set(:@data, 'foobar')
    assert_equal 'foobar', @sitemap.data
  end

end
