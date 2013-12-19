require 'pushbullet/http_exception'
require 'pushbullet/parse_json'

module Pushbullet
  module Connection
    private
    def connection
      @connection ||= Faraday.new(url: 'https://api.pushbullet.com/') do |f|
        f.request :basic_auth, api_key, ''
        f.request :multipart
        f.request :url_encoded

        f.response :logger

        f.use Pushbullet::ParseJSON
        f.use Pushbullet::HttpException

        f.adapter :net_http
      end
    end
  end
end
