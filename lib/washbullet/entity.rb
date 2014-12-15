module Washbullet
  class Entity < OpenStruct
    def initialize(attributes = {})
      super json_data
    end

    def receive(type, params)
      Pushable.get_const(type).push(receiver, identifer, params)
    end

    def receiver
      raise NotImplementedError
    end

    def identifer
      raise NotImplementedError
    end
  end
end
