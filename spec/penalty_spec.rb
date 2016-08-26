require 'penalty'

module Penalty
  RSpec.describe Calculator do
    include Table

    it 'return penalty with default policy' do
      kpi = 95
      client = '3'

      a, b = subject.get_penalty(kpi, client)
      expect(a).to eq penalty_table[0][1][0]
      expect(b).to eq penalty_table[0][1][1]
    end

    it 'raise error when no kpi in penalty table' do
      kpi = 800
      client = '2'
      expect{ subject.get_penalty(kpi, client) }
        .to raise_error ArgumentError, 'No penalty for kpi = 800'
    end

    it 'raise error when wrong policy' do
      kpi = 250
      client = 'wrong client'
      expect{ subject.get_penalty(kpi, client) }
        .to raise_error ArgumentError, "No Policy for client = #{client}"
    end
  end
end
