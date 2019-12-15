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
  
end