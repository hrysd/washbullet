module Washbullet
  class Pushable
    class Note < Washbullet::Pushable
      def required_parameters
        %i(title body)
      end
    end
  end
end
