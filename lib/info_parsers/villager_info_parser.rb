require_relative 'base_info_parser'

module AnimalCrossingAPI
  class VillagerInfoParser < BaseInfoParser
    def parse(name, list)
      super
    end

    private

    def horz_header_indices
      [4]
    end

    def vert_header_indices
      (6..15)
    end
  end
end
