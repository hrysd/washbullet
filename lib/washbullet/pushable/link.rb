module Washbullet
  class Pushable
    class Link < Washbullet::Pushable
      def required_parameters
        %i(title url body)
      end
    end
  end
end
