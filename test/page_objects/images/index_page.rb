module PageObjects
  module Images
    class IndexPage < PageObjects::Document
      path :root

      collection :images, locator: '.image-tag-list', item_locator: '.image-tag-container', contains: ImageCard do
        def view!
          # TODO
        end
      end

      def add_new_image!
        node.click_on('New Image')
        window.change_to(NewPage)
      end

      def showing_image?(url:, tags: nil)
        images.each do |image|
          return true if url == image.url && image.tags == tags
        end
        false
      end

      def clear_tag_filter!
        # TODO
      end
    end
  end
end
