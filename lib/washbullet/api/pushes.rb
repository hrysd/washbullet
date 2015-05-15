require 'washbullet/pushable'
require 'washbullet/pushable/file'
require 'washbullet/pushable/link'
require 'washbullet/pushable/note'

module Washbullet
  module API
    module Pushes
      def push_note(receiver: nil, identifier: nil, params: {})
        Washbullet::Pushable::Note.push(self, receiver, identifier, params)
      end

      def push_link(receiver: nil, identifier: nil, params: {})
        Washbullet::Pushable::Link.push(self, receiver, identifier, params)
      end

      def push_file(receiver: nil, identifier: nil, params: {})
        Washbullet::Pushable::File.push(self, receiver, identifier, params)
      end

      def get_pushes(modified_after = nil, cursor = nil)
        params = {modified_after: modified_after, cursor: cursor}

        params = params.values.all?(&:nil?) ? {} : params

        get 'v2/pushes', params
      end

      def delete_push(push_iden)
        delete "/v2/pushes/#{push_iden}"
      end
    end
  end
end
