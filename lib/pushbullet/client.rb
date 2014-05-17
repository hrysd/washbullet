require 'faraday'
require 'mime/types'

require 'pushbullet/request'
require 'pushbullet/api'

module Pushbullet
  class Client
    include Request
    include API

    attr_reader :api_key

    def initialize(api_key)
      @api_key = api_key
    end
  end
end
