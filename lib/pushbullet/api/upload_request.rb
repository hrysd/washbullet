# TODO: we should make Faraday middleware of upload request
module Pushbullet
  module API
    module Pushes
      module UploadRequest
        private

        def something(file_name, file_path, &block)
          mime_type = MIME::Types.type_for(file_path).first.to_s
          data      = get('/v2/upload-request', file_name: file_name, file_type: mime_type)
          io        = Faraday::UploadIO.new(file_path, mime_type)

          upload_url = data.body['upload_url']
          payload    = data.body['data']

          res = upload_request(upload_url, payload.merge(file: io))

          raise 'somthing whent wrong' unless res.status == 204

          yield data.body
        end

        def upload_request(upload_url, payload)
          Faraday.new(url: upload_url) {|f|
            f.request :multipart
            f.request :url_encoded
            f.adapter :net_http
          }.post {|r|
            r.body = payload
          }
        end
      end
    end
  end
end
