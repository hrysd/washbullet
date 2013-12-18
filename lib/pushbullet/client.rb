require 'faraday'

require 'pushbullet/request'
require 'pushbullet/response'
require 'pushbullet/connection'

module Pushbullet
  class Client
    include Connection
    include Request

    attr_accessor :api_key

    def initialize(api_key)
      @api_key = api_key
    end

    def devices
      get('/api/devices')
    end

    def contacts
      get('/v2/contacts')
    end

    def push_note(device_id, title, body)
      push(:note, device_id, title: title, body: body)
    end

    def push_link(device_id, title, url)
      push(:link, device_id, title: title, url: url)
    end

    def push_address(device_id, title, address)
      push(:address, device_id, title: title, address: address)
    end

    def push_list(device_id, title, items)
      push(:list, device_id, title: title, items: items)
    end

    def push_file(device_id, file)
      io = Faraday::UploadIO.new(file, 'image/png')

      push(:file, device_id, file: io)
    end

    private

    def push(type, device_id, payload)
      post('/api/pushes', payload.merge(device_id: device_id, type: type))
    end
  end
end
