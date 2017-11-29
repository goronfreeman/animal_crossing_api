require_relative 'base'
require_relative '../bug'

module AnimalCrossingAPI
  module Formatter
    class Bug < Base
      class << self
        def format(arr)
          attrs = AnimalCrossingAPI::Bug.attrs
          arr.map.with_index do |str, i|
            send("format_#{attrs[i]}", str)
          end
        end

        private

        def format_available_in_rain(str)
          to_bool(str)
        end

        def format_appearances(str)
          str.split(',')
        end
      end
    end
  end
end
