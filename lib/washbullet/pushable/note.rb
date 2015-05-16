module Washbullet
  class Pushable
    class Note < Pushable
      def type
        :note
      end

      def required_parameters
        %i(title body)
      end
    end
  end
end
