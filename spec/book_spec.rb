require './lib/book'

describe Book do
  context 'initialize book ' do
    book = Book.new('o realy', 'Good', '12-06-2020', archived: false, id: 501)

    it 'Should return publisher, cover state, published date, archived state and id' do
      expect(book.can_be_archived?).to be false
    end
  end
end
