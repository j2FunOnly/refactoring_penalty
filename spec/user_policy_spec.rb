require 'penalty'

class MyPolicy
  include Penalty::Policy::Base

  first_level_penalty '4'
  second_level_penalty '1', '2'
  third_level_penalty '3', '5'
end

module Penalty
  RSpec.describe Calculator do
    include Table

    it 'return penalty with custom policy' do
      calculator = described_class.new
      calculator.policy = MyPolicy
      a, b = subject.get_penalty 150, '4'
      expect([a, b]).to eq penalty_table[1][2]
    end
  end
end
