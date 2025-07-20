require 'rails_helper'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(described_class.add("")).to eq(0)
    end

    it 'returns number for single input' do
      expect(described_class.add("5")).to eq(5)
    end

    it 'returns sum for two numbers' do
      expect(described_class.add("1,2")).to eq(3)
    end

    it 'handles new lines between numbers' do
      expect(described_class.add("1\n2,3")).to eq(6)
    end

    it 'supports custom delimiter' do
      expect(described_class.add("//;\n1;2")).to eq(3)
    end

    it 'raises error for negative numbers' do
      expect { described_class.add("1,-2,-3") }.to raise_error("negative numbers not allowed -2,-3")
    end

    it 'ignores numbers greater than 1000' do
      expect(described_class.add("2,1001")).to eq(2)
    end

    it 'supports delimiters of any length' do
      expect(described_class.add("//[***]\n1***2***3")).to eq(6)
    end

    it 'supports multiple single-character delimiters' do
      expect(described_class.add("//[*][%]\n1*2%3")).to eq(6)
    end

    it 'supports multiple multi-character delimiters' do
      expect(described_class.add("//[***][%%]\n1***2%%3")).to eq(6)
    end
  end
end
