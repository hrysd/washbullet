module Washbullet
  class Push
    attr_reader :body

    def initialize(response_body)
      @body = response_body
    end

    def type
      body['type']
    end

    def created
      Time.at(body['created'])
    end

    def modified
      Time.at(body['modified'])
    end

    private

    def identifier
      body['iden']
    end
  end
end
