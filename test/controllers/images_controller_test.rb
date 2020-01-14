require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    Image.delete_all
  end

  test 'should get root' do
    get root_url
    assert_response :success
  end

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

  test 'should be descending order html' do
    img_num = 10
    img_num.times do |n|
      Image.create(url: "https://www.images.com/#{n}", tag_list: "Outdoors, Tag#{n}")
    end
    get root_url
    assert_select 'div', attributes: { class: 'image-tag-wrapper' }, count: 10
    assert_select 'div', attributes: { class: 'image-tag-wrapper' } do |elements|
      elements.each do |element|
        assert_select element, 'img', count: 1 do |img_html|
          assert_equal "https://www.images.com/#{img_num - 1}", img_html.attribute('src').value
        end
        assert_select element, 'p', count: 1 do |p_html|
          assert_equal "Outdoors-Tag#{img_num - 1}", p_html.text.delete(' ')
        end
        img_num -= 1
      end
    end
  end
end
