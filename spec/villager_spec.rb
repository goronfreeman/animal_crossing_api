require 'minitest/autorun'
require 'minitest/spec'
require_relative '../lib/animal_crossing_api/villager'

describe AnimalCrossingAPI::Villager do
  describe 'instance methods' do
    before do
      @villager = AnimalCrossingAPI::Villager.find_one('Al')
    end

    it '#gender returns the correct value' do
      @villager.gender.must_equal 'Male'
    end

    it '#personality returns the correct value' do
      @villager.personality.must_equal 'Lazy'
    end

    it '#species returns the correct value' do
      @villager.species.must_equal 'Gorilla'
    end

    it '#birthday returns the correct value' do
      @villager.birthday.must_equal 'October 18th (Libra)'
    end

    it '#initial_phrase returns the correct value' do
      @villager.initial_phrase.must_equal 'hoo hoo ha (City Folk) ayyyeee'
    end

    it '#initial_clothes returns the correct value' do
      @villager.initial_clothes.must_equal 'Red Warmup Suit'
    end

    it '#home_request returns the correct value' do
      @villager.home_request.must_equal 'A kid-friendly exercise room'
    end

    it '#skill returns the correct value' do
      @villager.skill.must_equal 'Jumping rope'
    end

    it '#goal returns the correct value' do
      @villager.goal.must_equal 'Journalist'
    end

    it '#coffee returns the correct value' do
      @villager.coffee.must_equal 'Mocha,Lots of milk,Three spoonfuls of sugar'
    end

    it '#style returns the correct value' do
      @villager.style.must_equal 'Basic'
    end

    it '#favorite_song returns the correct value' do
      @villager.favorite_song.must_equal 'Steep Hill'
    end

    it '#appearances returns the correct value' do
      @villager.appearances.must_equal 'CF, NL, HHD'
    end
  end

  describe 'class methods' do
    describe '::find' do
      describe 'when there are matches' do
        it 'returns an array of matching names' do
          villager_list = AnimalCrossingAPI::Villager.find('Al')
          villager_list.must_equal %w[Al Alfonso Alice Alli]
        end
      end

      describe 'when there are no matches' do
        it 'returns an empty array' do
          villager_list = AnimalCrossingAPI::Villager.find('foobar')
          villager_list.must_be_empty
        end
      end
    end

    describe '::find_by' do
      describe 'when there are matches' do
        it 'returns an array of matching names' do
          villager_list = AnimalCrossingAPI::Villager.find_by(species: 'pig')
          villager_list.must_equal %w[Agnes Chops Cobb Curly Gala Hugh Kevin Lucy Pancetti Peggy Rasher Spork Truffles]
        end
      end

      describe 'when there are no matches' do
        it 'returns an empty array' do
          villager_list = AnimalCrossingAPI::Villager.find_by(species: 'foobar')
          villager_list.must_be_empty
        end
      end
    end

    describe '::find_one' do
      describe 'when there are matches' do
        it 'returns an Villager object' do
          villager = AnimalCrossingAPI::Villager.find_one('Al')
          villager.must_be_kind_of AnimalCrossingAPI::Villager
        end
      end

      describe 'when there are no matches' do
        it 'returns an empty array' do
          villager_list = AnimalCrossingAPI::Villager.find_one('foobar')
          villager_list.must_be_nil
        end
      end
    end
  end
end
