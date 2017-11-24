# frozen_string_literal: true

require_relative 'base'

module AnimalCrossingAPI
  module Parser
    module Info
      class Creature < Base
        class << self
          def parse(name, list)
            super
          end

          private

          def horz_header_indices
            [6, 8, 10]
          end

          def vert_header_indices
            (12..16)
          end
        end
      end
    end
  end
end
