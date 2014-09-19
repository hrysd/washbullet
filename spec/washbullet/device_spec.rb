require 'spec_helper'

describe Washbullet::Device do
  describe '#new' do
    before(:all) do
      stubrequests
      @client ||= Washbullet::Client.new('ABCDEFGHIJKLMN')
      @device ||= Washbullet::Device.new(@client.get_devices.body["devices"][0], @client)
    end
    before(:each) do
      stubrequests
    end
    it "should return a device object" do
      expect(@device.is_a?(Washbullet::Device)).to eq true
    end
    it "should have the proper data for the device" do
      expect(@device.iden).to eq("u1qSJddxeKwOGuGW")
      expect(@device.push_token).to eq("u1qSJddxeKwOGuGWu1qSJddxeKwOGuGWu1qSJddxeKwOGuGWu1qSJddxeK")
    end
    it "should know what connection it is using" do
      expect(@device.client).to eq(@client)
    end
    it "should push a note with the correct response" do
      response = @device.push_note("Note title", "Note body").body
      expect(response["title"]).to eq("Note title")
      expect(response["body"]).to eq("Note body")
      expect(response["target_device_iden"]).to eq("ubddjAy95rgBxc")
    end
    it "should return an array of devices when calling client.devices" do
      expect(@client.devices.is_a?(Array)).to eq true
      expect(@client.devices[0].is_a?(Washbullet::Device)).to eq true
    end
  end
end
