module PageObjects
  module Images
    class NewPage < PageObjects::Document
      path :new_image
      path '/images'

      form_for :image do
        element :url
        element :tag_list
        element :error_msg, locator: '.error'
      end

      def create_image!(image_url: nil, image_tags: nil)
        image.url.set(image_url)
        image.tag_list.set(image_tags)
        node.click_on('Create Image')
        window.change_to(ShowPage, NewPage)
      end

      def error
        error_msg.text
      end
    end
  end
end
