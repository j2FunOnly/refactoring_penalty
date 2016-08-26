require_relative 'table'
require_relative 'policy/policy'
require_relative 'policy/default'

module Penalty
  class Calculator
    include Table

    def initialize
      @policy = Policy::Default.new
    end

    def get_penalty(kpi, client)
      penalty = penalty_table.fetch(kpi.to_i / 100) do
        raise ArgumentError, "No penalty for kpi = #{kpi}"
      end

      penalty.fetch(@policy.call(client).to_int)
    end

    def policy=(policy)
      @policy = policy.new
    end
  end
end
