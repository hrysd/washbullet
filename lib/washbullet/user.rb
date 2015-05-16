require 'washbullet/entity'

module Washbullet
  class User < Entity
    def identifier
      body['iden']
    end
  end
end
