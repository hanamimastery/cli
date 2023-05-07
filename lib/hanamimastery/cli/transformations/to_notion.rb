# frozen_string_literal: true

require 'commonmarker'

module Hanamimastery
  module CLI
    module Transformations
      class ToPRO
        # TODO: Make it Configurable
        HOST = "https://hanamimastery.com"

        # Transforms Markdown input to output compatible with Notion
        #
        def call(id, content)
          image_patern = /\!(\[\[)(.+)(\]\])/
          result
            .gsub(image_pattern, "![#{'\2'.humanize.tr('-', ''))}](#{HOST}/images/episodes/#{id})")
        end
      end
    end
  end
end
