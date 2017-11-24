# frozen_string_literal: true

require_relative 'base'
require_relative 'parsers/info/song'
require_relative 'parsers/list/song'
require_relative 'matchers/lax'

module AnimalCrossingAPI
  class Song < Base
    LIST_URI = 'http://animalcrossing.wikia.com/wiki/K.K._Slider_song_list_(New_Leaf)'

    @info_parser = Parser::Info::Song
    @list        = Parser::List::Song.parse(LIST_URI)
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
        games
        mood
        owned_by
        characters_on_cover
      ]
    end
  end
end
