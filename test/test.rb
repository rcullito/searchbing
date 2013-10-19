require '../lib/searchbing.rb'
require 'test/unit'

class TestSearchBing < Test::Unit::TestCase
  
  def test_constructor
    bing_image = Bing.new('testkey', 10, 'Image')
    assert_equal(true, bing_image.respond_to?(:num_results))
    assert_equal(true, bing_image.respond_to?(:account_key))
    assert_equal(true, bing_image.respond_to?(:type))
  end
end