module Washbullet
  module API
    module Me
      def me
        User.new(get('/v2/users/me').body)
      end
    end
  end
end
