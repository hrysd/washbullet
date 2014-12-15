module Washbullet
  class Device < Entity
    def receiver
      :device
    end

    def identifer
      self.iden
    end
  end
end
