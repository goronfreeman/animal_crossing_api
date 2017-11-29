require_relative 'base'
require_relative '../art'

module AnimalCrossingAPI
  module Formatter
    class Art < Base
      class << self
        def format(arr)
          attrs = AnimalCrossingAPI::Art.attrs
          arr.map.with_index do |str, i|
            send("format_#{attrs[i]}", str)
          end
        end
      end
    end
  end
end
