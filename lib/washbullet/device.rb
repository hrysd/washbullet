require 'washbullet/entity'

module Washbullet
  class Device < Entity
    def self.from_response(response)
      response.body['devices'].each_with_object([]) {|attributes, memo|
        next unless attributes['active']

        memo << new(attributes)
      }
    end

    def identifier
      body['iden']
    end

    def nickname
      body['nickname']
    end

    private

    def receiver
      :device
    end
  end
end
