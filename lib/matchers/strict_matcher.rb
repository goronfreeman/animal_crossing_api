require_relative 'base_matcher'

module AnimalCrossingAPI
  class StrictMatcher < BaseMatcher
    def match(query, list)
      super
    end

    private

    def find_matches(query, list)
      keys = list.keys.select { |key| key.start_with?(query.downcase) }
      keys.map { |key| list[key][:name] }
    end
  end
end
