# Child classes are expected to define #table and #headers.
#
# Returns a Nokogiri::XML::NodeSet containing the category table.
# def table(doc)
#   doc.css('#mw-content-text .wikitable')
# end
#
# Returns an Enumerable containing the indices of the table headers.
# def headers
#   [0, 24]
# end

require 'nokogiri'
require 'open-uri'

module AnimalCrossingAPI
  class BaseListParser
    def parse(list_url)
      rows  = table_rows(list_url)
      names = names(rows)
      urls  = urls(rows)
      personalities = personalities(rows)

      {}.tap do |hash|
        names.each.with_index do |name, i|
          hash[name.downcase] = { name: name, url: urls[i], personality: personalities[i] }
        end
      end
    end

    private

    def rows(table)
      # Tables do not have thead or tbody, so skip the headers.
      table.css('tr').reject.with_index { |_el, i| headers.include?(i) }
    end

    def table_rows(list_url)
      doc = Nokogiri::HTML(open(list_url))
      rows(table(doc))
    end

    def names(rows)
      rows.map { |row| extract_text(row.at_css('td')) }
    end

    def urls(rows)
      rows.map { |row| row.at_css('td a')['href'] }
    end

    def personalities(rows)
      []
    end

    def extract_text(row)
      row.inner_text.strip.chomp
    end
  end
end
