require_relative 'base_list_parser'

module AnimalCrossingAPI
  class DefaultListParser < BaseListParser
    def parse(list_url)
      super
    end

    private

    def table(doc)
      doc.css('#mw-content-text table')[2]
    end

    def headers
      [0]
    end
  end
end
