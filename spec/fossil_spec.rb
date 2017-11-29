require 'minitest/autorun'
require 'minitest/spec'
require_relative '../lib/animal_crossing_api/fossil'

describe AnimalCrossingAPI::Fossil do
  describe 'instance methods' do
    before do
      @fossil = AnimalCrossingAPI::Fossil.find_one('Amber')
    end

    it '#scientific_name returns the correct value' do
      @fossil.scientific_name.must_equal 'None'
    end

    it '#period returns the correct value' do
      @fossil.period.must_equal 'Unknown'
    end

    it '#price returns the correct value' do
      @fossil.price.must_equal 'Animal Crossing' => 1200,
                               'Wild World'      => 1200,
                               'City Folk'       => 1200,
                               'New Leaf'        => 1200
    end

    it '#appearances returns the correct value' do
      @fossil.appearances.must_equal ['Animal Crossing',
                                      'Wild World',
                                      'City Folk',
                                      'New Leaf']
    end

    it '#regional_names returns the correct value' do
      @fossil.regional_names.must_equal 'Germany' => 'Bernstein',
                                        'Italy'   => 'Ambra',
                                        'France'  => 'Ambre'
    end
  end

  describe 'class methods' do
    describe '::find' do
      describe 'when there are matches' do
        it 'returns an array of matching names' do
          fossil_list = AnimalCrossingAPI::Fossil.find('diplo')
          fossil_list.must_equal ['Diplo Chest',
                                  'Diplo Hip',
                                  'Diplo Neck',
                                  'Diplo Skull',
                                  'Diplo Tail']
        end
      end

      describe 'when there are no matches' do
        it 'returns an empty array' do
          fossil_list = AnimalCrossingAPI::Fossil.find('foobar')
          fossil_list.must_be_empty
        end
      end
    end

    describe '::find_one' do
      it 'returns an Fossil object' do
        fossil = AnimalCrossingAPI::Fossil.find_one('Amber')
        fossil.must_be_kind_of AnimalCrossingAPI::Fossil
      end
    end
  end
end
