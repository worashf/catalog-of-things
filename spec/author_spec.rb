require './lib/author'

describe Author do
  context 'Initialize author ' do
    author = Author.new('Worash', 'Abocherugn')
    it 'Should be return author first name and last name' do
      expect(author.first_name).to eq 'Worash'
      expect(author.last_name).to eq 'Abocherugn'
      expect(author.items).to eq []
    end
  end
end
