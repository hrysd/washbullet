module Pushbullet
  module API
    module Users
      def users
        get '/v2/users/me'
      end
    end
  end
end
