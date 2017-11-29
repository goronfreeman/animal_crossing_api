require_relative 'base'
require_relative '../song'

module AnimalCrossingAPI
  module Formatter
    class Song < Base
      class << self
        def format(arr)
          attrs = AnimalCrossingAPI::Song.attrs
          arr.map.with_index do |str, i|
            send("format_#{attrs[i]}", str)
          end
        end

        private

        def format_characters_on_cover(str)
          str.split(', ')
        end
      end
    end
  end
end
