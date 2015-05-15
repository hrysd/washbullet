RSpec.describe Washbullet::API::Subscriptions do
  let(:client) { Washbullet::Client.new(test_api_key) }

  describe '#subscriptions', :vcr do
    subject(:subscriptions) { client.subscriptions }

    specify 'Get list subscriptions' do
      expect(subscriptions.first).to be_kind_of(Washbullet::Channel)
    end
  end

  describe '#channel_info', :vcr do
    subject(:channel_info) { client.channel_info(tag) }

    context 'when channel is existing' do
      let(:tag) { 'docs-hrysd-org' }

      specify 'Get information about a channel' do
        expect(channel_info).to be_kind_of(Washbullet::Channel)
      end
    end

    context 'when channel is not existing' do
      let(:tag) { 'invalid' }

      specify 'raise error' do
        expect { channel_info }.to raise_error
      end
    end
  end
end
