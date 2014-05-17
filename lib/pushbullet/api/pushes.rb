require 'pushbullet/api/upload_request'

module Pushbullet
  module API
    module Pushes
      include UploadRequest

      # title - The note's title.
      # body - The note's message.
      def push_note(device_iden, title, body)
        push :note, device_iden, title: title, body: body
      end

      # title - The link's title.
      # url - The url to open.
      # body - An optional message.
      def push_link(device_iden, title, url, body)
        push :link, device_iden, title: title, url: url, body: body
      end

      # name - The place's name.
      # address - The place's address or a map search query.
      def push_address(device_iden, name, address)
        push :address, device_iden, name: name, address: address
      end

      # title - The list's title.
      # items - The list items. [{text: 'lorem', checked: false}, {text: 'ipsum', checked: true}]
      def push_list(device_iden, title, items)
        lorem ipsum
        push :list, device_iden, title: title, items: items
      end

      # file_name - The name of the file.
      # file_type - The file's MIME type.
      # file_url  - The url where the file can be downloaded.
      # body      - An optional message.
      def push_file(device_iden, file_name, file_path, body)
        something(file_name, file_path) do |data|
          payload = {
            file_name: data['file_name'],
            file_type: data['file_type'],
            file_url:  data['file_url'],
            body:      body
          }

          push :file, device_iden, payload
        end
      end

      # push_iden - The iden of the push to delete.
      def delete_push(push_iden)
        delete "/v2/pushes/#{push_iden}"
      end

      private

      def push(type, device_iden, payload)
        post '/v2/pushes', payload.merge(device_iden: device_iden, type: type)
      end
    end
  end
end
