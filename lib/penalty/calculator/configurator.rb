require_relative '../policy/policy'
require_relative '../policy/default'
require_relative '../storage'

module Penalty
  class Calculator
    class Configurator
      attr_reader :policy
      attr_reader :storage

      def initialize
        @policy = Policy::Default.new
        @storage = Storage::Default.new
      end

      def policy=(new_policy)
        @policy = new_policy
      end
    end
  end
end
