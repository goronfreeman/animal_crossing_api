require_relative 'base'
require_relative '../deep_sea_creature'

module AnimalCrossingAPI
  module Formatter
    class DeepSeaCreature < Base
      class << self
        def format(arr)
          attrs = AnimalCrossingAPI::DeepSeaCreature.attrs
          arr.map.with_index do |str, i|
            send("format_#{attrs[i]}", str)
          end
        end

        private

        def format_shadow_size(str)
          arr = str.split(', ')
          { 'size' => arr[0], 'speed' => arr[1] }
        end
      end
    end
  end
end
