module Washbullet
  class Pushable
    class Link < Washbullet::Pushable
      def type
        :link
      end

      def required_parameters
        %i(title url body)
      end
    end
  end
end
