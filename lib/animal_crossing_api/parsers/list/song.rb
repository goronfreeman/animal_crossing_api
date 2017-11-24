# frozen_string_literal: true

require_relative 'base'

module AnimalCrossingAPI
  module Parser
    module List
      class Song < Base
        class << self
          def parse(list_url)
            super
          end

          private

          # This is actually an unordered list.
          def table(doc)
            doc.at_css('#mw-content-text ol')
          end

          def rows(table)
            table.css('li')
          end

          def names(rows)
            rows.map { |row| extract_text(row) }
          end

          def urls(rows)
            rows.map { |row| row.at_css('a')['href'] }
          end
        end
      end
    end
  end
end
