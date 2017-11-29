require_relative 'base'
require_relative '../villager'

module AnimalCrossingAPI
  module Formatter
    class Villager < Base
      class << self
        def format(arr)
          attrs = AnimalCrossingAPI::Villager.attrs
          arr.map.with_index do |str, i|
            send("format_#{attrs[i]}", str)
          end
        end

        private

        def format_initial_phrase(str)
        end

        def format_initial_clothes(str)
        end

        def format_birthday(str)
          keys = ['date', 'star sign']
          vals = str.delete('()')
                    .rpartition(' ')
                    .reject { |el| el =~ /^\s*$/ }

          construct_hash(keys, vals)
        end

        def format_coffee(str)
          keys = %w[beans milk sugar]
          vals = str.split(',')

          construct_hash(keys, vals)
        end
      end
    end
  end
end
