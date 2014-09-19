
module Washbullet
  class Contact < Pushable
    
    #for a contact the push id is an email
    def push_id
      self.email
    end
    
    private

    #contacts also use the push_to_contact method which passes along the email params
    def push(type, email, payload)
      @client.send(:push_to_contact, type, email, payload)
    end
    
  end
end