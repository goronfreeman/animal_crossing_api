require_relative 'default_list_parser'

module AnimalCrossingAPI
  class VillagerListParser < DefaultListParser
    def parse(list_url)
      super
    end

    private

    def personalities(rows)
      rows.map { |row| extract_text(row.css('td').at(2)) }.map { |p| p.sub(/[♂ ♀]/, '').strip }
    end
  end
end
