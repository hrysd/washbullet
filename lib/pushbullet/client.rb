require 'faraday'
require 'mime/types'
require 'pushbullet/request'
require 'pushbullet/api'
require 'pushbullet/secret_api'

module Pushbullet
  class Client
    include Request
    include API
    include SecretAPI

    attr_reader :api_key

    def initialize(api_key)
      @api_key = api_key
    end
  end
end
