# frozen_string_literal: true

require_relative 'base'

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
            (6..15)
          end
        end
      end
    end
  end
end
