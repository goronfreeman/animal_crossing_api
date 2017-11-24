# frozen_string_literal: true

require_relative 'base'

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
        end
      end
    end
  end
end
