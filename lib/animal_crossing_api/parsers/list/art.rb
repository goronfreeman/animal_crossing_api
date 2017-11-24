# frozen_string_literal: true

require_relative 'base'

module AnimalCrossingAPI
  module Parser
    module List
      class Art < Base
        class << self
          def parse(list_url)
            super
          end

          private

          def table(doc)
            doc.css('#mw-content-text .wikitable')
          end

          def headers
            # Paintings & sculptures are in two separate tables.
            [0, 24]
          end
        end
      end
    end
  end
end
