module Washbullet
  class Contact < Entity
    def receiver
      :email
    end

    def identifer
      self.email
    end
  end
end
