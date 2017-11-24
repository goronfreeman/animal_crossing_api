require 'minitest/autorun'
require 'minitest/spec'
require_relative '../lib/animal_crossing_api/fish'

describe AnimalCrossingAPI::Fish do
  describe 'instance methods' do
    before do
      @fish = AnimalCrossingAPI::Fish.find_one('Bitterling')
    end

    it '#location returns the correct value' do
      @fish.location.must_equal 'River'
    end

    it '#price returns the correct value' do
      @fish.price.must_equal '900 Bells (WW, CF, NL)1,300 Bells (AC)'
    end

    it '#size returns the correct value' do
      @fish.size.must_equal '3.5 in. 10 cm'
    end

    it '#shadow_size returns the correct value' do
      @fish.shadow_size.must_equal 'Tiny'
    end

    it '#time_of_year returns the correct value' do
      @fish.time_of_year.must_equal 'December to February (GCN),November to February (WW, CF, NL)'
    end

    it '#time_of_day returns the correct value' do
      @fish.time_of_day.must_equal 'All day'
    end

    it '#scientific_name returns the correct value' do
      @fish.scientific_name.must_equal 'Acheilognathus melanogaster'
    end

    it '#family returns the correct value' do
      @fish.family.must_equal 'Cyprinidae - Minnows/Carp'
    end

    it '#appearances returns the correct value' do
      @fish.appearances.must_equal 'AF, AF+, AC, AFe+, WW, CF, NL'
    end

    it '#rarity returns the correct value' do
      @fish.rarity.must_equal 'Fairly Common (✭✭)'
    end

    it '#regional_names returns the correct value' do
      @fish.regional_names.must_equal 'Amarguillo Rodeo Bouvière Bitterling'
    end
  end

  describe 'class methods' do
    describe '::find' do
      describe 'when there are matches' do
        it 'returns an array of matching names' do
          fish_list = AnimalCrossingAPI::Fish.find('bass')
          fish_list.must_equal ['Black bass', 'Sea bass']
        end
      end

      describe 'when there are no matches' do
        it 'returns an empty array' do
          fish_list = AnimalCrossingAPI::Fish.find('foobar')
          fish_list.must_be_empty
        end
      end
    end

    describe '::find_one' do
      it 'returns an Fish object' do
        fish = AnimalCrossingAPI::Fish.find_one('Bitterling')
        fish.must_be_kind_of AnimalCrossingAPI::Fish
      end
    end
  end
end
