# frozen_string_literal: true

require_relative 'creature'
require_relative '../../formatters/bug'

module AnimalCrossingAPI
  module Parser
    module Info
      class Bug < Creature
        class << self
          def parse(name, list)
            super
          end

          private

          def horz_header_indices
            super
          end

          def vert_header_indices
            super
          end

          def format_arr(arr)
            Formatter::Bug.format(arr)
          end
        end
      end
    end
  end
end
