require './lib/label'
describe Label do
  context 'initialize label' do
    label = Label.new('new title', 'red')
    it 'should return label title and label color' do
      expect(label.title).to eq 'new title'
      expect(label.color).to eq 'red'
      expect(label.items.length).to eq 0
    end
  end
end
