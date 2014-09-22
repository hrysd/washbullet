require 'spec_helper'

describe Washbullet::Contact do
  describe '#new' do
    before(:all) do
      stubrequests
      @client ||= Washbullet::Client.new('ABCDEFGHIJKLMN')
      @contact ||= Washbullet::Contact.new(@client.get_contacts.body['contacts'][0], @client)
    end
    before(:each) do
      stubrequests
    end
    it 'should return a device object' do
      expect(@contact.is_a?(Washbullet::Contact)).to eq true
    end
    it 'should know what connection it is using' do
      expect(@contact.client).to eq(@client)
    end
    it 'should have the proper data for the device' do
      expect(@contact.iden).to eq('ubdcjAfszs0Smi')
      expect(@contact.name).to eq('Ryan Oldenburg')
    end
    it 'should push a note with the correct response' do
      response = @contact.push_note('Test Title', 'Test body').body
      expect(response['title']).to eq('Test Title')
      expect(response['body']).to eq('Test body')
      expect(response['sender_email']).to eq('ryan@pushbullet.com')
      expect(response['target_device_iden']).to eq(nil)
    end
    it 'should return an array of devices when calling client.devices' do
      expect(@client.contacts.is_a?(Array)).to eq true
      expect(@client.contacts[0].is_a?(Washbullet::Contact)).to eq true
    end
  end
end
