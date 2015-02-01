require 'washbullet/entity'

module Washbullet
  class Device < Entity
    private

    def receiver
      :device
    end

    def identifer
      body['iden']
    end
  end
end
