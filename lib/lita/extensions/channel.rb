module Lita
  module Extensions
    class Channel

      def self.call(payload)
        route   = payload[:route]
        message = payload[:message]

        if message.source.room == route.extensions[:channel]
          return true
        else
          return false
        end
      end

    end

    Lita.register_hook(:validate_route, Channel)

  end
end
