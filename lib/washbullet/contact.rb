require 'washbullet/entity'

module Washbullet
  class Contact < Entity
    private

    def receiver
      :email
    end

    def identifer
      body['email']
    end
  end
end
