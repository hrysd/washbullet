RSpec.describe Washbullet::Pushable::File do
  describe '.push', :vcr do
    let(:client) { Washbullet::Client.new(test_api_key) }

    subject(:push) {
      described_class.push(
        client,
        :device,
        nil,
        {
          file_name: 'Green',
          file_path: 'spec/fixtures/green.png',
          body:      'Color is green'
        }
      )
    }

    specify do
      expect(push).to      be_kind_of(Washbullet::Push)
      expect(push.type).to eq('file')
    end
  end
end
