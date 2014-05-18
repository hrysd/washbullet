module Washbullet
  module API
    module Pushes
      def push_note(device_iden, title, body)
        push :note, device_iden, title: title, body: body
      end

      def push_link(device_iden, title, url, body)
        push :link, device_iden, title: title, url: url, body: body
      end

      def push_address(device_iden, name, address)
        push :address, device_iden, name: name, address: address
      end

      def push_list(device_iden, title, items)
        push :list, device_iden, title: title, items: items
      end

      def push_file(device_iden, file_name, file_path, body)
        upload_file(file_name, file_path) do |data|
          payload = {
            file_name: data['file_name'],
            file_type: data['file_type'],
            file_url:  data['file_url'],
            body:      body
          }

          push :file, device_iden, payload
        end
      end

      def pushes(modified_after = nil, cursor = nil)
        params = {modified_after: modified_after, cursor: cursor}

        params = params.values.all?(&:nil?) ? {} : params

        get 'v2/pushes', params
      end

      def delete_push(push_iden)
        delete "/v2/pushes/#{push_iden}"
      end

      private

      def upload_file(file_name, file_path, &block)
        mime_type = MIME::Types.type_for(file_path).first.to_s

        data = upload_request(file_name, mime_type)

        upload_url = data.body['upload_url']
        payload    = data.body['data']

        io   = Faraday::UploadIO.new(file_path, mime_type)

        post upload_url, payload.merge(file: io)

        yield data.body
      end

      def upload_request(file_name, mime_type)
        get '/v2/upload-request', file_name: file_name, file_type: mime_type
      end

      def push(type, device_iden, payload)
        post '/v2/pushes', payload.merge(device_iden: device_iden, type: type)
      end
    end
  end
end
