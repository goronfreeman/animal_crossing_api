# frozen_string_literal: true

require_relative 'base'

module AnimalCrossingAPI
  module Parser
    module List
      class Default < Base
        class << self
          def parse(list_url)
            super
          end

          private

          def table(doc)
            doc.css('#mw-content-text table')[2]
          end

          def headers
            [0]
          end
        end
      end
    end
  end
end
