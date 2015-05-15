module Washbullet
  module API
    module Subscriptions
      def subscriptions
        response = get('/v2/subscriptions')

        Washbullet::Channel.from_response(response)
      end

      def channel_info(tag)
        response = get('/v2/channel-info', tag: tag).body

        Washbullet::Channel.new(response)
      end
    end
  end
end
