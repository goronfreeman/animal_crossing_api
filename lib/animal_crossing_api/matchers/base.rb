# frozen_string_literal: true

# Child classes are expected to define #find_matches.
#
# Returns an Array containing all matching results.
# def find_matches(query, list)
#   list.keys.select { |name| name.start_with?(query) }
# end

module AnimalCrossingAPI
  module Matcher
    class Base
      class << self
        def match(query, list)
          results = find_matches(query, list)
          return results if results.any?
          []
        end
      end
    end
  end
end
