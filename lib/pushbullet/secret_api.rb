module Pushbullet
  module SecretAPI
    def contacts
      get('/v2/contacts')
    end

    def push_note_to(target_email, title, body)
      push_to :note, target_email, title: title, body: body
    end

    def push_link_to(target_email, title, url)
      push_to :link, target_email, title: title, url: url
    end

    def push_address_to(target_email, title, address)
      push_to :address, target_email, title: title, address: address
    end

    # FIXME Now, can send *only* one item
    def push_list_to(target_email, title, items)
      push_to :list, target_email, title: title, items: items
    end

    private

    def push_to(type, target_email, payload)
      post '/api/pushes', payload.merge(target_email: target_email, type: type)
    end
  end
end
