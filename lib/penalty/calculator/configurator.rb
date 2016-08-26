require_relative '../policy/policy'
require_relative '../policy/default'

module Penalty
  class Calculator
    class Configurator
      attr_reader :policy

      def initialize
        @policy = Policy::Default.new
      end

      def policy=(new_policy)
        @policy = new_policy.new
      end
    end
  end
end
