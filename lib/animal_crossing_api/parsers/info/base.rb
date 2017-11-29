# frozen_string_literal: true

# Child classes are expected to define #horz_header_indices and #vert_header_indices.
#
# Returns an Enumerable containing the indices of the horizontal table headers.
# def horz_header_indices
#   [6, 8, 10]
# end
#
# Returns an Enumerable containing the indices of the vertical table headers.
# def vert_header_indices
#   (12..16)
# end

require 'nokogiri'
require 'open-uri'

module AnimalCrossingAPI
  module Parser
    module Info
      class Base
        class << self
          def parse(name, list)
            url = url(name, list)
            construct_hash(find_rows(find_table(url)))
          end

          private

          def url(name, list)
            base   = 'http://animalcrossing.wikia.com'
            suffix = list[name.downcase][:url]

            "#{base}#{suffix}"
          end

          def fetch_document(url)
            Nokogiri::HTML(open(url))
          end

          def find_table(url)
            # Select table by text content because there is no other good way.
            fetch_document(url).at_css('.WikiaArticle table:contains("Appearances")')
          end

          def find_rows(table)
            table.css('tr')
          end

          def construct_hash(rows)
            keys = extract_info(rows, header_ranges[0], header_ranges[1], 0)
            vals = format_arr(extract_info(rows, data_ranges[0], data_ranges[1], 1))

            # TODO: Refactor to use attrs from class.
            Hash[keys.map { |k| k.downcase.split.join('_').to_sym }.zip(vals)]
          end

          def horizontal(rows, arr)
            arr.flat_map { |i| rows.at(i).css('td').map(&:inner_text) }
          end

          def vertical(rows, range, index)
            range.map { |i| rows.at(i).css('td').map(&:inner_text).at(index) }
          end

          def prep_arr(arr)
            arr.map { |str| str.strip.chomp }
          end

          def format_arr(arr)
            arr
          end

          def extract_info(rows, horz_header_indices, vert_header_indices, index)
            prep_arr(horizontal(rows, horz_header_indices) + vertical(rows, vert_header_indices, index))
          end

          def header_ranges
            [horz_header_indices, vert_header_indices]
          end

          def data_ranges
            [increment(horz_header_indices), vert_header_indices]
          end

          def increment(range)
            range.map { |i| i + 1 }
          end
        end
      end
    end
  end
end
