# frozen_string_literal: true

module AnimalCrossingAPI
  class Base
    def self.find(query)
      matcher.match(query, list)
    end

    # Currently supports name, url, personality, and species.
    def self.find_by(**args)
      matches = list.select do |_key, hash|
        args.each_pair.map { |k, v| hash[k].casecmp?(v) }.all?
      end

      return [] if matches.empty?
      matches.map { |_key, hash| hash[:name] }
    end

    def self.find_one(name)
      return nil unless list.keys.include?(name.downcase)
      attributes = info_parser.parse(name, list)
      new.tap { |x| x.send(:assign_attributes, attributes) }
    end

    private

    def assign_attributes(attributes)
      attrs.each do |attr|
        self.class.send(:attr_reader, attr)
        instance_variable_set("@#{attr}", attributes[attr])
      end
    end
  end
end
