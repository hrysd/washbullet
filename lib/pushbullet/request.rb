module Pushbullet
  module Request
    def get(path, params = {})
      request(:get, path, params)
    end

    def post(path, payload)
      request(:post, path, payload)
    end

    def delete(path)
      request(:delete, path)
    end

    private

    def request(method, path, params = {})
      response = connection.send(method) {|request|
        request.url path
        request.params = params if method == :get
        request.body   = params if method == :post
      }
    end
  end
end
