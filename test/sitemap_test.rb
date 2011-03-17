require 'test/unit'
require 'doublecheck'
require 'fakeweb'

class SitemapTest < Test::Unit::TestCase
  def setup
    @body = IO.read(File.join('test', 'fixtures', 'sitemap.xml'))
    @sitemap_url = 'http://www.example.com/sitemap.xml'
    FakeWeb.register_uri(:get, @sitemap_url, :body => @body)
  end

  def test_initialize_sets_url_instance_variable
    setup
    sitemap = DoubleCheck::Sitemap.new(@sitemap_url)
    assert_equal @sitemap_url, sitemap.instance_variable_get(:@url)
  end

  def test_urls
    setup
    expected_urls = ['http://www.example.com/', 'http://www.example.com/foo']
    sitemap = DoubleCheck::Sitemap.new(@sitemap_url)
    assert_equal expected_urls, sitemap.urls
  end
end
