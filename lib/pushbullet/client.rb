require 'faraday'
require 'mime/types'

require 'pushbullet/api'
require 'pushbullet/basic_authentication'
require 'pushbullet/http_exception'
require 'pushbullet/parse_json'
require 'pushbullet/request'

module Pushbullet
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

        f.use Pushbullet::BasicAuthentication, @api_key, ''
        f.use Pushbullet::ParseJSON
        f.use Pushbullet::HttpException

        f.adapter :net_http
      end
    end

    def connection_options
      @connection_options ||= {
        :builder => middleware,
        :headers => {
          :accept     => 'application/json',
          :user_agent => "Pushbullet Ruby Gem #{Pushbullet::VERSION}",
        }
      }
    end

    private

    def connection
      @connection ||= Faraday.new(ENDPOINT, connection_options)
    end
  end
end
