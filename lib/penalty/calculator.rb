require_relative 'calculator/configurator'

module Penalty
  class Calculator
    def initialize
      yield config if block_given?
    end

    def get_penalty(kpi, client)
      penalty = penalty_table.fetch(kpi.to_i / 100) do
        raise ArgumentError, "No penalty for kpi = #{kpi}"
      end

      penalty.fetch(config.policy.call(client).to_int)
    end

    def config
      @config ||= Configurator.new
    end

    private

    def penalty_table
      @table ||= get_penalties
    end

    def penalty_table!
      @table = get_penalties
    end

    def get_penalties
      config.storage.get_penalties
    end
  end
end
