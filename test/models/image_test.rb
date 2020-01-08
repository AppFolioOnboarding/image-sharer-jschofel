require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'empty url' do
    image = Image.new(url: '')
    assert_not image.valid?
  end

  test 'invalid url' do
    image = Image.new(url: 'abc')
    assert_not image.valid?
  end

  test 'invalid edge' do
    image = Image.new(url: 'http:www.website')
    assert_not image.valid?
  end

  test 'valid http min' do
    image = Image.new(url: 'http://')
    assert image.valid?
  end

  test 'valid https min' do
    image = Image.new(url: 'https://')
    assert image.valid?
  end

  test 'valid http full' do
    image = Image.new(url: 'http://www.website.com')
    assert image.save
  end

  test 'valid https full' do
    image = Image.new(url: 'https://www.website.com')
    assert image.valid?
  end
end
