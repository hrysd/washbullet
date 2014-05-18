require 'json'

module Pushbullet
  class ParseJSON < Faraday::Response::Middleware
    def on_complete(env)
      env[:body] = JSON.parse(env[:body]) unless unparsable_status_codes.include?(env.status)
    end

    def unparsable_status_codes
      [204]
    end
  end
end
