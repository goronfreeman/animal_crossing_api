# frozen_string_literal: true

require_relative 'base'
require_relative 'parsers/info/art'
require_relative 'parsers/list/art'
require_relative 'matchers/lax'

module AnimalCrossingAPI
  class Art < Base
    LIST_URI = 'http://animalcrossing.wikia.com/wiki/Art_(New_Leaf)'

    @info_parser = Parser::Info::Art
    @list        = Parser::List::Art.parse(LIST_URI)
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
          real_name
          artist
          appearances
          regional_names
        ]
      end
    end
  end
end
