# frozen_string_literal: true

require_relative 'base'
require_relative '../../formatters/villager'

module AnimalCrossingAPI
  module Parser
    module Info
      class Villager < Base
        class << self
          def parse(name, list)
            super
          end

          private

          def horz_header_indices
            [4]
          end

          def vert_header_indices
            (6..16)
          end

          def format_arr(arr)
            Formatter::Villager.format(arr)
          end
        end
      end
    end
  end
end
