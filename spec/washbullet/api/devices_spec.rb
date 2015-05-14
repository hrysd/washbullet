RSpec.describe Washbullet::API::Devices do
  describe '#devices', :vcr do
    let(:client) { Washbullet::Client.new(test_api_key) }

    subject(:devices) { client.devices }

    specify 'Get own active devices' do
      expect(devices.first).to be_kind_of(Washbullet::Device)
      expect(
        devices.all? {|device| device.body['active'] }
      ).to be_truthy
    end
  end
end
