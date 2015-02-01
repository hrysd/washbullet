module Washbullet
  class Pushable
    class File < Washbullet::Pushable
      def push
        raise MissingParameter unless options.keys == requried_parameters

        file_name = params[:file_name]
        file_path = params[:file_path]

        upload_file(file_name, file_path) do |data|
          payload = {
            file_name: data['file_name'],
            file_type: data['file_type'],
            file_url:  data['file_url'],
            body:      body,
            type:      type
          }

          payload = specify_receiver(payload)

          client.post('/v2/pushes', payload)
        end
      end

      def type
        :file
      end

      def required_parameters
        %i(file_name, file_path, body)
      end

      private

      def upload_file(file_name, file_path, &block)
        mime_type = MIME::Types.type_for(file_path).first.to_s

        data = upload_request(file_name, mime_type)

        upload_url = data.body['upload_url']
        params     = data.body['data']

        io = Faraday::UploadIO.new(file_path, mime_type)

        post upload_url, params.merge(file: io)

        yield data.body
      end

      def upload_request(file_name, mime_type)
        get '/v2/upload-request', file_name: file_name, file_type: mime_type
      end
    end
  end
end
