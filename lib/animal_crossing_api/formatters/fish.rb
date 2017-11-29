require_relative 'base'
require_relative '../fish'

module AnimalCrossingAPI
  module Formatter
    class Fish < Base
      class << self
        def format(arr)
          attrs = AnimalCrossingAPI::Fish.attrs
          arr.map.with_index do |str, i|
            send("format_#{attrs[i]}", str)
          end
        end
      end
    end
  end
end
