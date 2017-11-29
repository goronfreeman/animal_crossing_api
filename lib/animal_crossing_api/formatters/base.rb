module AnimalCrossingAPI
  module Formatter
    class Base
      class << self
        private

        def method_missing(method_name, str, &block)
          if method_name.to_s =~ /^format_(.*)/
            str
          else
            super
          end
        end

        def respond_to_missing?(method_name, *args, &block)
          method_name.to_s.start_with?('format_') || super
        end

        def format_appearances(str)
          str.split(', ').map do |el|
            appearance_mappings[el] || el
          end
        end

        alias format_games format_appearances

        def format_regional_names(str)
          # TODO
        end

        # Helpers

        def appearance_mappings
          { 'AF'              => 'Animal Forest',
            'AF+'             => 'Animal Forest +',
            'AC'              => 'Animal Crossing',
            'AFe+'            => 'Animal Forest e+',
            'WW'              => 'Wild World',
            'CF'              => 'City Folk',
            'NL'              => 'New Leaf',
            'HHD'             => 'Happy Home Designer',
            'PC'              => 'Pocket Camp',
            'Dōbutsu no Mori' => 'Animal Crossing: The Movie' }
        end

        def construct_hash(keys, vals)
          keys.map.with_object({}).with_index do |(key, hash), i|
            hash[key] = vals[i]
          end
        end

        def to_bool(str)
          mappings = {
            'Yes' => true,
            'No'  => false
          }

          mappings[str]
        end
      end
    end
  end
end
