require_relative 'base'
require_relative '../fossil'

module AnimalCrossingAPI
  module Formatter
    class Fossil < Base
      class << self
        def format(arr)
          attrs = AnimalCrossingAPI::Fossil.attrs
          arr.map.with_index do |str, i|
            send("format_#{attrs[i]}", str)
          end
        end

        private

        def format_appearances(str)
          str.split(',')
        end
      end
    end
  end
end
