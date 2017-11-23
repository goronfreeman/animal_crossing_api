require_relative '../info_parsers/villager_info_parser'
require_relative '../list_parsers/villager_list_parser'
require_relative '../matchers/strict_matcher'

require 'byebug'

module AnimalCrossingAPI
  class Villager
    LIST_URL = 'http://animalcrossing.wikia.com/wiki/Villager_list_(New_Leaf)'.freeze

    attr_reader :gender, :personality, :species, :birthday, :initial_phrase, :initial_clothes,
                :home_request, :skill, :goal, :coffee, :style, :favorite_song, :appearances

    def initialize
    end

    def self.find(name)
      list = VillagerListParser.new.parse(LIST_URL)
      return nil unless list.keys.include?(name.downcase)
      resource = VillagerInfoParser.new.parse(name, list)
      Villager.new.tap { |x| x.parse_resource!(resource) }
    end

    def self.search(query)
      list = VillagerListParser.new.parse(LIST_URL)
      StrictMatcher.new.match(query, list)
    end

    def parse_resource!(resource)
      @gender          = resource[:gender]
      @personality     = resource[:personality]
      @species         = resource[:species]
      @birthday        = resource[:birthday]
      @initial_phrase  = resource[:initial_phrase]
      @initial_clothes = resource[:initial_clothes]
      @home_request    = resource[:home_request]
      @skill           = resource[:skill]
      @goal            = resource[:goal]
      @coffee          = resource[:coffee]
      @style           = resource[:style]
      @favorite_song   = resource[:favorite_song]
      @appearances     = resource[:appearances]
    end
  end
end
