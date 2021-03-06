# frozen_string_literal: true

require_relative 'base'
require_relative '../../formatters/art'

module AnimalCrossingAPI
  module Parser
    module Info
      class Art < Base
        class << self
          def parse(name, list)
            super
          end

          private

          def horz_header_indices
            []
          end

          def vert_header_indices
            (2..5)
          end

          def format_arr(arr)
            Formatter::Art.format(arr)
          end
        end
      end
    end
  end
end
