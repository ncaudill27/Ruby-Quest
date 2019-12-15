require_relative 'spec_helper'

describe Dice do

  describe "has attributes" do
    it "sides, count, name with setters and getters" do
      test = Dice.new(1)
      test.sides = 20
      test.count = 4
     
      expect(test.name).to eq("4d20")
    end
  end
  
  describe "#roll" do
    it "returns a random roll within dice limits" do
      small = Dice.new(4)
      big = Dice.new(20,4)

      expect(small.roll).to be_between(1, 4)
      expect(big.roll).to be_between(4, 80)
      expect(small.roll).to be > 0
      expect(big.roll).to be > 3
    end
  end

  describe ".stat_roll" do
    it "returns a number between 3 and 18" do
      expect(Dice.stat_roll).to be_between(3,18)
    end
  end
end