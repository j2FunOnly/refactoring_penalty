require 'penaltytrator'
require 'user_policy'

RSpec.describe Penaltytrator do
  include PenaltyTable

  it 'return penalty with default policy' do
    a, b = subject.get_penalty(95, '3')
    expect(a).to eq penalty_table[0][1][0]
    expect(b).to eq penalty_table[0][1][1]
  end

  it 'return penalty with user policy' do
    custom_penalty = Penaltytrator.new
    custom_penalty.policy = UserPolicy
    a, b = subject.get_penalty 150, '4'
    expect(a).to eq penalty_table[1][2][0]
    expect(b).to eq penalty_table[1][2][1]
  end

  it 'raise error when no kpi in penalty table' do
    expect{ subject.get_penalty(800, 2) }
      .to raise_error ArgumentError, 'No penalty for kpi = 800'
  end

  it 'raise error when wrong client' do
    expect{ subject.get_penalty(250, 2) }
      .to raise_error ArgumentError, "No Policy for client = 2"
  end
end
