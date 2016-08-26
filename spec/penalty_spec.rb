require 'penalty'
require_relative 'support/custom_policy'

RSpec.describe Penalty::Calculator do
  let(:kpi) { 95 }
  let(:client) { '2' }
  let(:penalty_table) { Penalty::Storage::Default.new.get_penalties }

  describe 'return penalty' do
    it 'with default policy' do
      a, b = subject.get_penalty(kpi, client)
      expect([a, b]).to eq penalty_table[0][0]
    end

    it 'with custom policy' do
      calculator = described_class.new do |config|
        config.policy = CustomPolicy.new
      end

      a, b = calculator.get_penalty(kpi, client)
      expect([a, b]).to eq penalty_table[0][1]
    end

    it 'with json file penalties storage' do
      calculator = described_class.new do |config|
        config.storage = Penalty::Storage::JSONFile.new 'spec/fixtures/penalties.json'
      end
      a, b = calculator.get_penalty(kpi, client)
      expect([a, b]).to eq penalty_table[0][0]
    end
  end

  describe 'raise error' do
    it 'when no kpi in penalty table' do
      kpi = 800
      expect{ subject.get_penalty(kpi, client) }
        .to raise_error ArgumentError, 'No penalty for kpi = 800'
    end

    it 'when wrong policy' do
      client = 'wrong client'
      expect{ subject.get_penalty(kpi, client) }
        .to raise_error ArgumentError, "No Policy for client = #{client}"
    end
  end
end
