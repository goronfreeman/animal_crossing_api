# frozen_string_literal: true

require_relative 'creature'
require_relative '../../formatters/fish'

module AnimalCrossingAPI
  module Parser
    module Info
      class Fish < Creature
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
            Formatter::Fish.format(arr)
          end
        end
      end
    end
  end
end
