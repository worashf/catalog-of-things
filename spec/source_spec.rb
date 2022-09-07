require './lib/source'

describe Source do
  context 'initialzie source and test ' do
    name = ' form friend'
    source = Source.new(name, id: 300)
    it 'should be return source name and id' do
      expect(source.name).to eq name
      expect(source.id).to eq 300
      expect(source.items).to eq []
    end

    it 'Should be the instance of Source' do
      expect(source).to be_instance_of Source
    end
  end
end
