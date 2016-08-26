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
      custom_penalty = Calculator.new
      custom_penalty.policy = MyPolicy
      a, b = subject.get_penalty 150, '4'
      expect(a).to eq penalty_table[1][2][0]
      expect(b).to eq penalty_table[1][2][1]
    end
  end
end
