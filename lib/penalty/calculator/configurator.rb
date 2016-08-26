require_relative '../policy'
require_relative '../storage'

module Penalty
  class Calculator
    class Configurator
      attr_writer :policy, :storage

      def policy
        @policy ||= Policy::Default.new
      end

      def storage
        @storage ||= Storage::Default.new
      end

      def policy=(new_policy)
        @policy = new_policy
      end

      def storage=(new_storage)
        @storage = new_storage
      end
    end
  end
end
