# frozen_string_literal: true

require_relative 'base'

module AnimalCrossingAPI
  module Parser
    module Info
      class Song < Base
        class << self
          def parse(name, list)
            super
          end

          private

          def find_table(url)
            # Select table by text content because there is no other good way.
            fetch_document(url).at_css('.WikiaArticle table:contains("Games")')
          end

          def horz_header_indices
            []
          end

          def vert_header_indices
            (2..5)
          end
        end
      end
    end
  end
end
