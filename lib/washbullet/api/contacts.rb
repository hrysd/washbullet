module Washbullet
  module API
    module Contacts
      def contacts
        get '/v2/contacts'
      end

      def delete_contact(contact_iden)
        delete "/v2/contacts/#{contact_iden}"
      end
    end
  end
end
