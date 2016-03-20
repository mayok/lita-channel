module Lita
  module Extensions
    class Channel

      def self.call(payload)
        route   = payload[:route]
        message = payload[:message]

        if message.source.room == Lita::Room.find_by_name(route.extensions[:channel]).id
          return true
        else
          return false
        end
      end

    end

    Lita.register_hook(:validate_route, Channel)

  end
end
