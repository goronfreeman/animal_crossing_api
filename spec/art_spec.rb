require 'minitest/autorun'
require 'minitest/spec'
require_relative '../lib/animal_crossing_api/art'

describe AnimalCrossingAPI::Art do
  describe 'instance methods' do
    before do
      @art = AnimalCrossingAPI::Art.find_one('Amazing Painting')
    end

    it '#real_name returns the correct value' do
      @art.real_name.must_equal 'The Night Watch'
    end

    it '#artist returns the correct value' do
      @art.artist.must_equal 'Rembrandt Harmeszoon van Rijn'
    end

    it '#appearances returns the correct value' do
      @art.appearances.must_equal ['Animal Forest +',
                                   'Animal Crossing',
                                   'Animal Forest e+',
                                   'Wild World',
                                   'City Folk',
                                   'New Leaf']
    end

    it '#regional_names returns the correct value' do
      @art.regional_names.must_equal 'France' => 'Toile incroyable',
                                     'Spain'  => 'Cuadro holandés',
                                     'Italy'  => 'Quadro stupendo'
    end
  end

  describe 'class methods' do
    describe '::find' do
      describe 'when there are matches' do
        it 'returns an array of matching names' do
          art_list = AnimalCrossingAPI::Art.find('statue')
          art_list.must_equal ['Ancient Statue',
                               'Beautiful Statue',
                               'Gallant Statue',
                               'Great Statue',
                               'Motherly Statue',
                               'Mystic Statue',
                               'Robust Statue',
                               'Valiant Statue']
        end
      end

      describe 'when there are no matches' do
        it 'returns an empty array' do
          art_list = AnimalCrossingAPI::Art.find('foobar')
          art_list.must_be_empty
        end
      end
    end

    describe '::find_one' do
      it 'returns an Art object' do
        art = AnimalCrossingAPI::Art.find_one('Amazing Painting')
        art.must_be_kind_of AnimalCrossingAPI::Art
      end
    end
  end
end
