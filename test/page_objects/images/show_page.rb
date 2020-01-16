module PageObjects
  module Images
    class ShowPage < PageObjects::Document
      path :image
      collection :tag_links, locator: '.tags', item_locator: 'li' do
        element :tag_link, locator: '.tag'
      end

      def image_url
        node.find('img')[:src]
      end

      def tags
        output = []
        tag_links.each do |tag_a|
          output << tag_a.text
        end
        output
      end

      def delete
        # TODO
        yield node.driver.browser.switch_to.alert
      end

      def delete_and_confirm!
        # TODO
        window.change_to(IndexPage)
      end

      def go_back_to_index!
        node.click_on("Ropes Application")
        window.change_to(IndexPage)
      end
    end
  end
end
