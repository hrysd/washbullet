module Washbullet
  class Pushable
    class Address < Washbullet::Pushable
      def type
        :address
      end

      def required_parameters
        %i(name address)
      end
    end
  end
end
