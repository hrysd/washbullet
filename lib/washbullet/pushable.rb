
module Washbullet
  class Pushable < OpenStruct
    attr_accessor :client

    def initialize(json_data, client)
      @client=client
      super json_data
    end

    def push_note(title, body)
      push :note, push_id, title: title, body: body
    end

    def push_link(title, url, body)
      push :link, push_id, title: title, url: url, body: body
    end

    def push_address(name, address)
      push :address, push_id, name: name, address: address
    end

    def push_list(title, items)
      push :list, push_id, title: title, items: items
    end
    
    def push_id
      self.iden
    end

    private

    def push(type, id, payload)
      @client.send(:push, type, id, payload)
    end

  end
end