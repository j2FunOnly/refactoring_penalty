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
    end
  end
end
