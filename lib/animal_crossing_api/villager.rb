# frozen_string_literal: true

require_relative 'base'
require_relative 'parsers/info/villager'
require_relative 'parsers/list/villager'
require_relative 'matchers/strict'

module AnimalCrossingAPI
  class Villager < Base
    LIST_URI = 'http://animalcrossing.wikia.com/wiki/Villager_list_(New_Leaf)'

    @info_parser = Parser::Info::Villager
    @list        = Parser::List::Villager.parse(LIST_URI)
    @matcher     = Matcher::Strict

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
          gender
          personality
          species
          birthday
          initial_phrase
          initial_clothes
          home_request
          skill
          goal
          coffee
          style
          favorite_song
          appearances
          regional_names
        ]
      end
    end
  end
end
