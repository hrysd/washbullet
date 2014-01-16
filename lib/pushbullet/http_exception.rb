require 'faraday'

module Pushbullet
  class BadRequest    < StandardError; end
  class Unauthorized  < StandardError; end
  class RequestFailed < StandardError; end
  class Forbidden     < StandardError; end
  class NotFound      < StandardError; end
  class ServerError   < StandardError; end

  class HttpException < Faraday::Response::Middleware
    def call(env)
      @app.call(env).on_complete do |response|
        case response[:status].to_i
        when 400
          raise Pushbullet::BadRequest,    'Often missing a required parameter'
        when 401
          raise Pushbullet::Unauthorized,  'No valid API key provided'
        when 402
          raise Pushbullet::RequestFailed, 'Parameters were valid but the request failed'
        when 403
          raise Pushbullet::Forbidden,     'The API key is not valid for that request'
        when 404
          raise Pushbullet::NotFound,      'The requested item doesn\'t exist'
        when 500..505
          raise Pushbullet::ServerError,   'Something went wrong on PushBullet\'s side'
        end
      end
    end
  end
end
