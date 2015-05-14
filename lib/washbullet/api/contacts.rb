module Washbullet
  module API
    module Contacts
      def contacts
        response = get('/v2/contacts')

        Washbullet::Contact.from_response(response)
      end

      def create_contact
        raise NotImplementedError
      end

      def update_contact
        raise NotImplementedError
      end

      def delete_contact
        raise NotImplementedError
      end
    end
  end
end
