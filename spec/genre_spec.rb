require './lib/genre'
describe Genre do
  context 'initialize genre' do
    genre = Genre.new('Fiction', id: 200)

    it 'should return genre name and id' do
      expect(genre.name).to eq 'Fiction'
      expect(genre.id).to eq 200
    end
  end
end
