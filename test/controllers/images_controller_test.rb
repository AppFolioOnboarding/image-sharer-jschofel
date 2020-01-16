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
      even = n.even? ? 'Even' : 'Odd'
      Image.create(url: "https://www.images.com/#{n}", tag_list: "Outdoors, Tag#{n}, #{even}")
    end
    get root_url
    assert_select 'div.image-tag-container', count: 10 do |elements|
      elements.each do |element|
        assert_select element, 'img', count: 1 do |img_html|
          assert_equal "https://www.images.com/#{img_num - 1}", img_html.attribute('src').value
        end
        assert_select element, 'ul', count: 1 do |p_html|
          assert_select p_html, 'a', count: 3
          assert_select p_html, 'a', count: 1, text: 'Outdoors'
          assert_select p_html, 'a', count: 1, text: "Tag#{img_num - 1}"
          even = (img_num - 1).even? ? 'Even' : 'Odd'
          assert_select p_html, 'a', count: 1, text: even
        end
        img_num -= 1
      end
    end
  end

  test 'should have correct number of results' do
    img_num = 10
    img_num.times do |n|
      even = n.even? ? 'Even' : 'Odd'
      Image.create(url: "https://www.images.com/#{n}", tag_list: "Outdoors, Tag#{n}, #{even}")
    end
    get root_path(tag: 'Outdoors')
    assert_select 'div.image-tag-container', count: img_num
    assert_select 'a', text: 'Even', count: img_num / 2
    assert_select 'a', text: 'Odd', count: img_num / 2
    get root_path(tag: 'Even')
    assert_select 'div.image-tag-container', count: img_num / 2
    assert_select 'a', text: 'Even', count: img_num / 2
    assert_select 'a', text: 'Odd', count: 0
    get root_path(tag: 'Odd')
    assert_select 'div.image-tag-container', count: img_num / 2
    assert_select 'a', text: 'Even', count: 0
    assert_select 'a', text: 'Odd', count: img_num / 2
  end
end
