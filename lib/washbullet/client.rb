require 'faraday'
require 'mime/types'

require 'washbullet/api'
require 'washbullet/basic_authentication'
require 'washbullet/http_exception'
require 'washbullet/parse_json'
require 'washbullet/request'
require 'washbullet/version'

module Washbullet
  class Client
    include Request
    include API

    ENDPOINT = 'https://api.pushbullet.com'

    attr_reader :api_key

    def initialize(api_key)
      @api_key = api_key
    end

    def middleware
      @middleware ||= Faraday::RackBuilder.new do |f|
        f.request :multipart
        f.request :url_encoded

        f.use Washbullet::BasicAuthentication, @api_key, ''
        f.use Washbullet::ParseJSON
        f.use Washbullet::HttpException

        f.adapter :net_http
      end
    end

    def connection_options
      @connection_options ||= {
        :builder => middleware,
        :headers => {
          :accept     => 'application/json',
          :user_agent => "Washbullet Ruby Gem #{Washbullet::VERSION}",
        }
      }
    end
    
    def devices
      return self.get_devices.body["devices"].map do |device_json|
        Washbullet::Device.new(device_json, self)
      end
    end
    def contacts
      return self.get_contacts.body["contacts"].map do |device_json|
        Washbullet::Contact.new(device_json, self)
      end
    end

    private

    def connection
      @connection ||= Faraday.new(ENDPOINT, connection_options)
    end
  end
end
