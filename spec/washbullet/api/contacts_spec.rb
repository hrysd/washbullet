RSpec.describe Washbullet::API::Contacts do
  describe '#contacts', :vcr do
    let(:client) { Washbullet::Client.new(test_api_key) }

    subject(:contacts) { client.contacts }

    specify 'Get own active contacts' do
      expect(contacts.first).to be_kind_of(Washbullet::Contact)
      expect(
        contacts.all? {|device| device.body['active'] }
      ).to be_truthy
   end
  end
end

