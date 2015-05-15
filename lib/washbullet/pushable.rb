require 'washbullet/push'

module Washbullet
  class Pushable
    class MissingParameter < StandardError; end

    attr_reader :client, :receiver, :identifer, :params

    def self.push(client, receiver, identifer, params)
      response = new(client, receiver, identifer, params).push

      Push.new(response.body)
    end

    def initialize(client, receiver, identifer, params)
      @client    = client
      @receiver  = receiver
      @identifer = identifer
      @params    = params
    end

    def push
      raise MissingParameter unless params.keys == required_parameters

      payload = params.merge(type: type)

      payload = specify_receiver(payload)

      client.post('/v2/pushes', payload)
    end

    def type
      raise NotImplementedError
    end

    def required_parameters
      raise NotImplementedError
    end

    def specify_receiver(payload)
      if receiver && identifer
        payload.merge(receiver_type => identifer)
      else
        payload
      end
    end

    def receiver_type
      case receiver
      when :device  then :device_iden
      when :email   then receiver
      when :channel then :channel_tag
      when :client  then :client_iden
      else
        raise NotImplementedError
      end
    end
  end
end
