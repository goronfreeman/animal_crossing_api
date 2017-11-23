# Child classes are expected to define #find_matches.
#
# Returns an Array containing all matching results.
# def find_matches(query, list)
#   list.keys.select { |name| name.start_with?(query) }
# end

module AnimalCrossingAPI
  class BaseMatcher
    def match(query, list)
      return query if exact_match?(query, list)
      results = find_matches(query, list)
      return results if results.any?
      false
    end

    private

    def exact_match?(query, list)
      list.keys.include?(query)
    end
  end
end
