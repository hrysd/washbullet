module Washbullet
  class Channel
    attr_reader :body

    def self.from_response(response)
      response.body['subscriptions'].each_with_object([]) {|attributes, memo|
        next unless attributes['active']

        memo << new(attributes['channel'])
      }
    end

    def initialize(response_body)
      @body = response_body
    end

    def name
      body['name']
    end

    def description
      body['description']
    end

    def identifier
      body['iden']
    end
  end
end
