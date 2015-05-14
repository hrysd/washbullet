module Washbullet
  module API
    module Devices
      def devices
        response = get('/v2/devices')

        Washbullet::Device.from_response(response)
      end

      def update_device
        raise NotImplementedError
      end

      def delete_device
        raise NotImplementedError
      end
    end
  end
end
