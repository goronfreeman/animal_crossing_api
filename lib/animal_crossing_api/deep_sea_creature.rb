# frozen_string_literal: true

require_relative 'base'
require_relative 'parsers/info/deep_sea_creature'
require_relative 'parsers/list/default'
require_relative 'matchers/lax'

module AnimalCrossingAPI
  class DeepSeaCreature < Base
    LIST_URI = 'http://animalcrossing.wikia.com/wiki/Deep-Sea_Creatures'

    @info_parser = Parser::Info::DeepSeaCreature
    @list        = Parser::List::Default.parse(LIST_URI)
    @matcher     = Matcher::Lax

    class << self
      attr_reader :info_parser, :list, :matcher
    end

    def self.find(query)
      super
    end

    def self.find_one(name)
      super
    end

    private

    def attrs
      %i[
        location
        price
        size
        shadow_size
        time_of_year
        time_of_day
        scientific_name
        family
        appearances
        regional_names
      ]
    end
  end
end
