module Washbullet
  class Authorization < Faraday::Request::Authorization
    def call(env)
      if env.url.to_s.match(Washbullet::Client::ENDPOINT)
        env.request_headers[KEY] = @header_value
      end

      @app.call(env)
    end
  end
end
