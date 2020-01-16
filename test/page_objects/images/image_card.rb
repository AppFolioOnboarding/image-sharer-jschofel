module PageObjects
  module Images
    class ImageCard < AePageObjects::Element
      def url
        node.find('img')[:src]
      end

      def tags
        output = []
        node.all('a.tag').each do |tag|
          output << tag.text
        end
        output
      end

      def click_tag!(tag_name)
        # TODO
      end
    end
  end
end
