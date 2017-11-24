# frozen_string_literal: true

require_relative 'base'

module AnimalCrossingAPI
  module Matcher
    class Lax < Base
      class << self
        def match(query, list)
          super
        end

        private

        def find_matches(query, list)
          keys = list.keys.select { |name| name =~ /#{query}/i }
          keys.map { |key| list[key][:name] }
        end
      end
    end
  end
end
