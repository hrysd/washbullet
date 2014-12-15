module Washbullet
  class Pushable
    class Address < Washbullet::Pushable
      def requried_parameters
        %i(name address)
      end
    end
  end
end
