RSpec.describe Washbullet::API::Me do
  describe '#me', :vcr do
    let(:client) { Washbullet::Client.new(test_api_key) }

    subject(:me) { client.me }

    specify 'Get the self information' do
      expect(me).to be_kind_of(Washbullet::User)
    end
  end
end
