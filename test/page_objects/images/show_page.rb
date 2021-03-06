require_relative 'image_card'

module PageObjects
  module Images
    class ShowPage < PageObjects::Document
      path :image
      element :container, locator: '.image-tag-container', is: ImageCard

      def image_url
        container.url
      end

      def tags
        container.tags
      end

      def delete
        node.click_on('Delete Image')
        yield node.driver.browser.switch_to.alert
      end

      def delete_and_confirm!
        node.click_on('Delete Image')
        node.driver.browser.switch_to.alert.accept
        window.change_to(IndexPage)
      end

      def go_back_to_index!
        node.click_on('Ropes Application')
        window.change_to(IndexPage)
      end
    end
  end
end
