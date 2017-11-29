# frozen_string_literal: true

require_relative 'base'
require_relative 'parsers/info/bug'
require_relative 'parsers/list/default'
require_relative 'matchers/lax'

module AnimalCrossingAPI
  class Bug < Base
    LIST_URI = 'http://animalcrossing.wikia.com/wiki/Bugs_(New_Leaf)'

    @info_parser = Parser::Info::Creature
    @list        = Parser::List::Default.parse(LIST_URI)
    @matcher     = Matcher::Lax

    class << self
      attr_reader :info_parser, :list, :matcher

      def find(query)
        super
      end

      def find_one(name)
        super
      end

      def attrs
        %i[
          location
          price
          size
          available_in_rain
          time_of_year
          time_of_day
          scientific_name
          family
          appearances
          rarity
          regional_names
        ]
      end
    end
  end
end
