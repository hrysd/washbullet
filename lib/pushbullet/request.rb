require 'pushbullet/connection'

module Pushbullet
  module Request
    include Connection

    def get(path)
      request(:get, path)
    end

    def post(path, payload)
      request(:post, path, payload)
    end

    private

    def request(method, path, payload = {})
      response = connection.send(method) {|request|
        request.url path
        request.body = payload if method == :post
      }
    end
  end
end
