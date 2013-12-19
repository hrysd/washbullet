module Pushbullet
  module API
    def devices
      get('/api/devices')
    end

    def push_note(device_id, title, body)
      push :note, device_id, title: title, body: body
    end

    def push_link(device_id, title, url)
      push :link, device_id, title: title, url: url
    end

    def push_address(device_id, title, address)
      push :address, device_id, title: title, address: address
    end

    # FIXME Now, can send *only* one item
    def push_list(device_id, title, items)
      push :list, device_id, title: title, items: items
    end

    def push_file(device_id, file_path)
      mime_type = MIME::Types.type_for(file_path).first.to_s
      io        = Faraday::UploadIO.new(file_path, mime_type)

      push :file, device_id, file: io
    end

    private

    def push(type, device_id, payload)
      post '/api/pushes', payload.merge(device_id: device_id, type: type)
    end
  end
end
