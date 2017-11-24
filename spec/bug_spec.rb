require 'minitest/autorun'
require 'minitest/spec'
require_relative '../lib/animal_crossing_api/bug'

describe AnimalCrossingAPI::Bug do
  describe 'instance methods' do
    before do
      @bug = AnimalCrossingAPI::Bug.find_one('Common butterfly')
    end

    it '#location returns the correct value' do
      @bug.location.must_equal 'Flying'
    end

    it '#price returns the correct value' do
      @bug.price.must_equal '80 Bells (AC)90 Bells (WW, CF, NL)'
    end

    it '#size returns the correct value' do
      @bug.size.must_equal '50 mm'
    end

    it '#available_in_rain returns the correct value' do
      @bug.available_in_rain.must_equal 'No'
    end

    it '#time_of_year returns the correct value' do
      @bug.time_of_year.must_equal 'March to October (AC)March to September (WW)March to June & September (CF, NL)'
    end

    it '#time_of_day returns the correct value' do
      @bug.time_of_day.must_equal '8am to 5pm (GCN)4am to 7pm (WW)4am to 7pm (CF, NL)8am to 4pm (CF Sept.)'
    end

    it '#scientific_name returns the correct value' do
      @bug.scientific_name.must_equal 'Pieris rapae'
    end

    it '#family returns the correct value' do
      @bug.family.must_equal 'Pieridae (White butterflies)'
    end

    it '#appearances returns the correct value' do
      @bug.appearances.must_equal 'AF, AF+, AC, AFe+, WW, CF, NL'
    end

    it '#rarity returns the correct value' do
      @bug.rarity.must_equal 'Common (★)'
    end

    it '#regional_names returns the correct value' do
      @bug.regional_names.must_equal 'Papillon commun    Piéride de la rave (NL)   Kohlweißling   Mariposa común   Farfalla comune'
    end
  end

  describe 'class methods' do
    describe '::find' do
      describe 'when there are matches' do
        it 'returns an array of matching names' do
          art_list = AnimalCrossingAPI::Bug.find('butterfly')
          art_list.must_equal ['Common butterfly', 'Yellow butterfly', 'Tiger butterfly', 'Peacock butterfly', 'Monarch butterfly', 'Emperor butterfly', 'Agrias butterfly', 'Raja Brooke butterfly', 'Birdwing butterfly']
        end
      end

      describe 'when there are no matches' do
        it 'returns an empty array' do
          art_list = AnimalCrossingAPI::Bug.find('foobar')
          art_list.must_be_empty
        end
      end
    end

    describe '::find_one' do
      it 'returns an Bug object' do
        art = AnimalCrossingAPI::Bug.find_one('Common butterfly')
        art.must_be_kind_of AnimalCrossingAPI::Bug
      end
    end
  end
end
