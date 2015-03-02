#!/usr/bin/env ruby

require_relative '../lib/searchbing.rb'
require 'test/unit'

class TestSearchBing < Test::Unit::TestCase

  unless ENV['BING_KEY']
    puts "\nNOTE: skipping tests that require a Bing search key. To run full test suite:\n"
    puts "  BING_KEY=your-bing-key  rake test"
  end

  def test_constructor
    bing_image = Bing.new('testkey', 10, 'Image', {:SomeParam => 'test'})
    assert_equal(true, bing_image.respond_to?(:num_results))
    assert_equal(true, bing_image.respond_to?(:account_key))
    assert_equal(true, bing_image.respond_to?(:type))
    assert_equal(true, bing_image.respond_to?(:params))
  end

  def test_image_search
    unless key=ENV['BING_KEY']
      return
    end
    bing_image = Bing.new(key, 10, 'Image')
    results = bing_image.search("puffin")
    assert(results[0][:ImageTotal].to_i > 15_000)
    assert_equal(10, results[0][:Image].length)
    first_image = results[0][:Image][0]
    assert(first_image[:MediaUrl])
    assert(first_image[:Width])
    assert(first_image[:Height])
    assert(first_image[:FileSize])
    assert(first_image[:ContentType])
    assert(first_image[:Thumbnail])
  end

  def test_web_only_search
    unless key=ENV['BING_KEY']
      return
    end
    web = Bing.new(key, 10, 'WebOnly')
    results = web.search("puffin")
    assert results[0][:Title]=~/Puffin/i
  end

end
