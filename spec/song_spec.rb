require 'minitest/autorun'
require 'minitest/spec'
require_relative '../lib/animal_crossing_api/song'

describe AnimalCrossingAPI::Song do
  describe 'instance methods' do
    before do
      @song = AnimalCrossingAPI::Song.find_one('Agent K.K.')
    end

    it '#games returns the correct value' do
      @song.games.must_equal ['Animal Forest e+',
                              'Wild World',
                              'City Folk',
                              'New Leaf',
                              'Happy Home Designer']
    end

    it '#mood returns the correct value' do
      @song.mood.must_equal 'Hard to say'
    end

    it '#owned_by returns the correct value' do
      # TODO: Happy Home Designer?
      # @song.owned_by.must_equal ['Vladimir', 'Walt', 'Moose (NL)', 'Booker', 'Copper']
      @song.owned_by.must_equal 'Animal Forest e+' => %w[Vladimir Walt Booker Copper],
                                'Wild World'       => %w[Vladimir Walt Booker Copper],
                                'City Folk'        => %w[Vladimir Walt Booker Copper],
                                'New Leaf'         => %w[Vladimir Walt Moose Booker Copper]
    end

    it '#characters_on_cover returns the correct value' do
      @song.characters_on_cover.must_equal ['Copper']
    end
  end

  describe 'class methods' do
    describe '::find' do
      describe 'when there are matches' do
        it 'returns an array of matching names' do
          song_list = AnimalCrossingAPI::Song.find('sp')
          song_list.must_equal ['Space K.K.', 'Spring Blossoms']
        end
      end

      describe 'when there are no matches' do
        it 'returns an empty array' do
          song_list = AnimalCrossingAPI::Song.find('foobar')
          song_list.must_be_empty
        end
      end
    end

    describe '::find_one' do
      it 'returns an Song object' do
        song = AnimalCrossingAPI::Song.find_one('Agent K.K.')
        song.must_be_kind_of AnimalCrossingAPI::Song
      end
    end
  end
end
