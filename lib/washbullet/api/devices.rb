module Washbullet
  module API
    module Devices
      def get_devices
        get '/v2/devices'
      end

      def delete_device(device_iden)
        delete "/v2/devices/#{device_iden}"
      end
    end
  end
end
