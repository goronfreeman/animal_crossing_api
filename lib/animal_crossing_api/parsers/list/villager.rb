# frozen_string_literal: true

require_relative 'default'

module AnimalCrossingAPI
  module Parser
    module List
      class Villager < Default
        class << self
          def parse(list_url)
            super
          end

          private

          def personalities(rows)
            rows.map { |row| extract_text(row.css('td').at(2)) }
                .map { |p| p.sub(/[♂ ♀]/, '').strip }
          end

          def species(rows)
            rows.map { |row| extract_text(row.css('td').at(3)) }
          end
        end
      end
    end
  end
end
