RSpec.describe Washbullet::Pushable::Link do
  describe '.push', :vcr do
    let(:client) { Washbullet::Client.new(test_api_key) }

    subject(:push) {
      described_class.push(
        client,
        :device,
        nil,
        {
          title: 'Check it out',
          url:   'https://www.pushbullet.com',
          body:  'Pushbullet is awesome'
        }
      )
    }

    specify do
      expect(push).to      be_kind_of(Washbullet::Push)
      expect(push.type).to eq('link')
    end
  end
end

