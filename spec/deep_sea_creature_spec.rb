require 'minitest/autorun'
require 'minitest/spec'
require_relative '../lib/animal_crossing_api/deep_sea_creature'

describe AnimalCrossingAPI::DeepSeaCreature do
  describe 'instance methods' do
    before do
      @deep_sea_creature = AnimalCrossingAPI::DeepSeaCreature.find_one('Seaweed')
    end

    it '#location returns the correct value' do
      @deep_sea_creature.location.must_equal 'Bottom of the Ocean'
    end

    it '#price returns the correct value' do
      @deep_sea_creature.price.must_equal 'Animal Crossing' => 200,
                                          'Wild World'      => 200,
                                          'City Folk'       => 200,
                                          'New Leaf'        => 200
    end

    it '#size returns the correct value' do
      # TODO: Check if this is metric.
      @deep_sea_creature.size.must_equal '30 inches'
    end

    it '#shadow_size returns the correct value' do
      # TODO: Key names?
      @deep_sea_creature.shadow_size.must_equal 'size'  => 'Large',
                                                'speed' => 'stationary'
    end

    it '#time_of_year returns the correct value' do
      @deep_sea_creature.time_of_year.must_equal 'Animal Crossing' => 'November-July',
                                                 'Wild World'      => 'November-July',
                                                 'City Folk'       => 'November-July',
                                                 'New Leaf'        => 'November-July'
    end

    it '#time_of_day returns the correct value' do
      @deep_sea_creature.time_of_day.must_equal 'Animal Crossing' => 'All day',
                                                'Wild World'      => 'All day',
                                                'City Folk'       => 'All day',
                                                'New Leaf'        => 'All day'
    end

    it '#scientific_name returns the correct value' do
      @deep_sea_creature.scientific_name.must_equal 'Undaria pinnatifida'
    end

    it '#family returns the correct value' do
      @deep_sea_creature.family.must_equal 'Alariaceae'
    end

    it '#appearances returns the correct value' do
      @deep_sea_creature.appearances.must_equal ['New Leaf']
    end

    it '#regional_names returns the correct value' do
      @deep_sea_creature.regional_names.must_equal 'Italy'  => 'Alga wakame',
                                                   'France' => 'Wakame',
                                                   'Spain'  => 'Alga wakame'
    end
  end

  describe 'class methods' do
    describe '::find' do
      describe 'when there are matches' do
        it 'returns an array of matching names' do
          deep_sea_creature_list = AnimalCrossingAPI::DeepSeaCreature.find('sea')
          deep_sea_creature_list.must_equal ['Seaweed',
                                             'Sea grapes',
                                             'Sea urchin',
                                             'Sea anemone',
                                             'Sea star',
                                             'Sea cucumber',
                                             'Sea slug']
        end
      end

      describe 'when there are no matches' do
        it 'returns an empty array' do
          deep_sea_creature_list = AnimalCrossingAPI::DeepSeaCreature.find('foobar')
          deep_sea_creature_list.must_be_empty
        end
      end
    end

    describe '::find_one' do
      it 'returns an DeepSeaCreature object' do
        deep_sea_creature = AnimalCrossingAPI::DeepSeaCreature.find_one('Seaweed')
        deep_sea_creature.must_be_kind_of AnimalCrossingAPI::DeepSeaCreature
      end
    end
  end
end
