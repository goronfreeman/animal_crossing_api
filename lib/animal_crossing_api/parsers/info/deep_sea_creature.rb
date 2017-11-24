# frozen_string_literal: true

require_relative 'creature'

module AnimalCrossingAPI
  module Parser
    module Info
      class DeepSeaCreature < Creature
        class << self
          def parse(name, list)
            super
          end

          private

          def vert_header_indices
            (12..15)
          end
        end
      end
    end
  end
end
