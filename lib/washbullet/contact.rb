require 'washbullet/entity'

module Washbullet
  class Contact < Entity
    def self.from_response(response)
      response.body['contacts'].each_with_object([]) {|attributes, memo|
        next unless attributes['active']

        memo << new(attributes)
      }
    end

    def name
      body['name']
    end

    def email
      body['email']
    end

    def image_url
      body['image_url']
    end

    private

    def receiver
      :email
    end

    def identifier
      body['email']
    end
  end
end
