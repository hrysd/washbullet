RSpec.describe Washbullet::Pushable::Note do
  describe '.push', :vcr do
    let(:client) { Washbullet::Client.new(test_api_key) }

    subject(:push) {
      described_class.push(
        client,
        :device,
        nil,
        {title: 'title', body: 'body'}
      )
    }

    specify do
      expect(push).to               be_kind_of(Washbullet::Push)
      expect(push.type).to          eq('note')
      expect(push.body['title']).to eq('title')
    end
  end
end
