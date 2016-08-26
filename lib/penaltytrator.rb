require_relative 'penalty_policy'
require_relative 'default_policy'
require_relative 'penalty_table'

class Penaltytrator
  include PenaltyTable

  def initialize
    @policy = DefaultPolicy.new
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
