require 'washbullet/entity'

module Washbullet
  class Push < Entity
    # TODO
    #def update
    #end

    def delete(client)
      client.delete("/v2/pushes/#{identifier}")
    end

    def type
      body['type']
    end

    private

    def identifier
      body['iden']
    end
  end
end
