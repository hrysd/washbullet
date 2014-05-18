module Pushbullet
  class BasicAuthentication < Faraday::Request::BasicAuthentication
    def call(env)
      if env.url.to_s.match(Pushbullet::Client::ENDPOINT)
        env.request_headers[KEY] = @header_value
      end

      @app.call(env)
    end
  end
end
