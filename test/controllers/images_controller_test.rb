require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_image_url
    assert_response :success
  end

  test 'should create image' do
    Image.create(url: 'https://')
    assert_difference('Image.count') do
      post images_url, params: { image: { url: 'https://www.website.com' } }
    end

    assert_redirected_to image_url(Image.last)
  end

  test 'should show image' do
    Image.create(url: 'https://')
    get image_url(Image.last)
    assert_response :success
  end
end
