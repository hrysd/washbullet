module Washbullet
  class Pushable
    class List < Washbullet::Pushable
      def type
        :list
      end

      def required_parameters
        %i(title items)
      end
    end
  end
end
