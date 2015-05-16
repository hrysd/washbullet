module Washbullet
  class Entity
    attr_reader :body

    def initialize(response_body)
      @body = response_body
    end

    def created
      Time.at(body['created'])
    end

    def modified
      Time.at(body['modified'])
    end

    private

    def receiver
      raise NotImplementedError
    end

    def identifier
      raise NotImplementedError
    end
  end
end
