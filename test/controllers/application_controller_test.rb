require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  setup do
    Image.delete_all
  end

  test 'should get root' do
    get root_url
    assert_response :success
  end

  test 'should be descending order html' do
    img_num = 10
    img_num.times { |n| Image.create(url: "https://www.images.com/#{n}") }
    get root_url
    assert_select 'img', count: 10
    assert_select 'img' do |elements|
      elements.each do |element|
        assert_equal "https://www.images.com/#{img_num - 1}", element.attribute('src').value
        img_num -= 1
      end
    end
  end
end
