# frozen_string_literal: true

require_relative 'base'
require_relative 'parsers/info/fossil'
require_relative 'parsers/list/fossil'
require_relative 'matchers/lax'

module AnimalCrossingAPI
  class Fossil < Base
    LIST_URI = 'http://animalcrossing.wikia.com/wiki/Fossils_(New_Leaf)'

    @info_parser = Parser::Info::Fossil
    @list        = Parser::List::Fossil.parse(LIST_URI)
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
        scientific_name
        period
        price
        appearances
        regional_names
      ]
    end
  end
end
