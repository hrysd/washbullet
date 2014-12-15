module Washbullet
  class Pushable
    class List < Washbullet::Pushable
      def requried_parameters
        %i(title items)
      end
    end
  end
end
