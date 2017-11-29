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
      @bug.price.must_equal 'Animal Crossing' => 80,
                            'Wild World'      => 90,
                            'City Folk'       => 90,
                            'New Leaf'        => 90
    end

    it '#size returns the correct value' do
      # TODO: Check on unit.
      @bug.size.must_equal '50 mm'
    end

    it '#available_in_rain returns the correct value' do
      @bug.available_in_rain.must_equal false
    end

    it '#time_of_year returns the correct value' do
      @bug.time_of_year.must_equal 'Animal Crossing' => 'March-October',
                                   'Wild World'      => 'March-September',
                                   'City Folk'       => 'March-June & September',
                                   'New Leaf'        => 'March-June & September'
    end

    it '#time_of_day returns the correct value' do
      # TODO: Includes another entry formatted like this: 8am to 4pm (CF Sept.). Need to deal with different times for different months.
      @bug.time_of_day.must_equal 'Animal Crossing' => '8am-5pm',
                                  'Wild World'      => '4am-7pm',
                                  'City Folk'       => '4am-7pm',
                                  'New Leaf'        => '4am-7pm'
    end

    it '#scientific_name returns the correct value' do
      @bug.scientific_name.must_equal 'Pieris rapae'
    end

    it '#family returns the correct value' do
      @bug.family.must_equal 'Pieridae (White butterflies)'
    end

    it '#appearances returns the correct value' do
      @bug.appearances.must_equal ['Animal Forest',
                                   'Animal Forest +',
                                   'Animal Crossing',
                                   'Animal Forest e+',
                                   'Wild World',
                                   'City Folk',
                                   'New Leaf']
    end

    it '#rarity returns the correct value' do
      # TODO: Think of better key name than 'name'
      @bug.rarity.must_equal name: 'Common', stars: '★'
    end

    it '#regional_names returns the correct value' do
      # TODO: Has two French names, so has to be a hash of hashes including the game.
      @bug.regional_names.must_equal 'France'  => 'Papillon commun',
                                     'France'  => 'Piéride de la rave (NL)',
                                     'Germany' => 'Kohlweißling',
                                     'Spain'   => 'Mariposa común',
                                     'Italy'   => 'Farfalla comune'
    end
  end

  describe 'class methods' do
    describe '::find' do
      describe 'when there are matches' do
        it 'returns an array of matching names' do
          art_list = AnimalCrossingAPI::Bug.find('butterfly')
          art_list.must_equal ['Common butterfly',
                               'Yellow butterfly',
                               'Tiger butterfly',
                               'Peacock butterfly',
                               'Monarch butterfly',
                               'Emperor butterfly',
                               'Agrias butterfly',
                               'Raja Brooke butterfly',
                               'Birdwing butterfly']
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
