module Washbullet
  class Pushable
    class MissingParameter < StandardError; end

    attr_reader :client, :receiver, :identifer, :params

    def self.push(client, receiver, identifer, params)
      new(client, receiver, identifer, params).push
    end

    def initialize(client, receiver, identifer, params)
      @client    = client
      @receiver  = receiver
      @identifer = identifer
      @params    = params
    end

    def type
      self.class.name.downcase.to_sym
    end

    def push
      raise MissingParameter unless params.keys == requried_parameters

      payload = params.merge(type: type)
      payload = specify_receiver

      client.post('/v2/pushes', payload)
    end

    def required_parameters
      raise NotImplementedError
    end

    def specify_receiver(payload)
      if receiver && identifer
        payload.merge(receiver => identifer)
      else
        payload
      end
    end
  end
end
