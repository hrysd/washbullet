module Washbullet
  module API
    module Me
      def me
        get '/v2/users/me'
      end
    end
  end
end
