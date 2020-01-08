require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image = Image.new
  end

  test 'should get new' do
    get new_image_url
    assert_response :success
  end

  test 'should create image' do
    assert_difference('Image.count') do
      post images_url, params: { image: { url: 'https://www.website.com' } }
    end

    assert_redirected_to image_url(Image.last)
  end

  test 'should show image' do
    get image_url(Image.last)
    assert_response :success
  end
end
