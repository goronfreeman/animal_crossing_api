# frozen_string_literal: true

require_relative 'base'
require_relative '../../formatters/fossil'

module AnimalCrossingAPI
  module Parser
    module Info
      class Fossil < Base
        class << self
          def parse(name, list)
            super
          end

          private

          def horz_header_indices
            []
          end

          def vert_header_indices
            (3..7)
          end

          def format_arr(arr)
            Formatter::Fossil.format(arr)
          end
        end
      end
    end
  end
end
